prompt
Prompt Enter Wait Event Name
prompt
prompt

SELECT 
  NULL BEGIN_TIME, NULL TOTAL_S, NULL "   1", NULL "   2", NULL "   4", NULL "   8",
  NULL "  16", NULL "  32", NULL "  64", NULL " 128", NULL " 256", NULL " 512",
  NULL "1024", NULL "2048", NULL "MORE" FROM DUAL WHERE 1 = 0
UNION ALL ( 
SELECT NULL BEGIN_TIME, NULL TOTAL_S, NULL "   1", NULL "   2", NULL "   4", NULL "   8",
  NULL "  16", NULL "  32", NULL "  64", NULL " 128", NULL " 256", NULL " 512",
  NULL "1024", NULL "2048", NULL "MORE" FROM DUAL WHERE 1 = 0
) UNION ALL ( SELECT * FROM ( 
WITH B_INFO AS
( SELECT /*+ MATERIALIZE */
    DECODE(DBID, -1, OWN_DBID, DBID) DBID,
    DECODE(INSTANCE_NUMBER, -1, USERENV('INSTANCE'), INSTANCE_NUMBER) INSTANCE_NUMBER,
    BEGIN_DATE,
    END_DATE,
    TO_TIMESTAMP(TO_CHAR(BEGIN_DATE, 'dd.mm.yyyy hh24:mi:ss'), 
      'dd.mm.yyyy hh24:mi:ss') BEGIN_TIME,
    TO_TIMESTAMP(TO_CHAR(END_DATE, 'dd.mm.yyyy hh24:mi:ss'), 
      'dd.mm.yyyy hh24:mi:ss') END_TIME,
    EVENT_NAME,
    AGGREGATE_BY,
    SORT_ORDER
  FROM
  ( SELECT
      -1 DBID,
      -1 INSTANCE_NUMBER,        /* -1 for current instance, -2 for all instances */
      TO_DATE('01.01.1000 11:55:00', 'dd.mm.yyyy hh24:mi:ss') BEGIN_DATE,
      TO_DATE('31.12.9999 18:05:00', 'dd.mm.yyyy hh24:mi:ss') END_DATE,
      '&event_name' EVENT_NAME,
      'SNAPSHOT' AGGREGATE_BY,  /* SNAPSHOT, DAY, HOUR_OF_DAY, INSTANCE, SS_INST, DAY_INST, HOD_INST */
      'DESC' SORT_ORDER    /* ASC, DESC */
    FROM
      DUAL
  ),
  ( SELECT DBID OWN_DBID FROM V$DATABASE )
),
SNAPSHOTS AS
( SELECT /*+ MATERIALIZE */
    DBID,
    INSTANCE_NUMBER,
    SNAP_ID,
    MIN_SNAP_ID,
    PREV_SNAP_ID,
    BEGIN_INTERVAL_TIME,
    END_INTERVAL_TIME,
    INTERVAL_SECONDS,
    RESTART
  FROM
  ( SELECT
      HSS2.DBID,
      HSS2.INSTANCE_NUMBER,
      HSS2.SNAP_ID,
      FIRST_VALUE(HSS2.SNAP_ID) OVER (PARTITION BY HSS2.INSTANCE_NUMBER ORDER BY HSS2.SNAP_ID) MIN_SNAP_ID,
      HSS1.SNAP_ID PREV_SNAP_ID,
      HSS2.BEGIN_INTERVAL_TIME,
      HSS2.END_INTERVAL_TIME,
      TO_CHAR(HSS2.END_INTERVAL_TIME, 'SSSSS') -
        TO_CHAR(HSS2.BEGIN_INTERVAL_TIME, 'SSSSS') +
        86400 * (TO_CHAR(HSS2.END_INTERVAL_TIME, 'J') - 
                 TO_CHAR(HSS2.BEGIN_INTERVAL_TIME, 'J'))
        INTERVAL_SECONDS,
      DECODE(HSS2.STARTUP_TIME, HSS1.STARTUP_TIME, 'NO', 'YES') RESTART
    FROM 
      B_INFO BI,
      DBA_HIST_SNAPSHOT HSS1, 
      DBA_HIST_SNAPSHOT HSS2
    WHERE
      HSS2.DBID = BI.DBID AND
      HSS1.DBID (+) = HSS2.DBID AND
      ( BI.INSTANCE_NUMBER = -2 OR
        HSS2.INSTANCE_NUMBER = BI.INSTANCE_NUMBER 
      ) AND
      HSS1.INSTANCE_NUMBER (+) = HSS2.INSTANCE_NUMBER AND
      HSS2.END_INTERVAL_TIME BETWEEN BI.BEGIN_TIME AND BI.END_TIME AND
      HSS1.SNAP_ID (+) = HSS2.SNAP_ID - 1
    ORDER BY
      HSS2.SNAP_ID
  )
),
EVENT_HISTOGRAM AS
( SELECT /*+ MATERIALIZE */
    EH.*
  FROM
    B_INFO BI,
    DBA_HIST_EVENT_HISTOGRAM EH
  WHERE
    EH.EVENT_NAME = BI.EVENT_NAME
),
EVENT_HISTOGRAM_PER_SNAPSHOT AS
( SELECT /*+ MATERIALIZE */
    SS.DBID,
    SS.INSTANCE_NUMBER,
    SS.SNAP_ID,
    SS.BEGIN_INTERVAL_TIME,
    BI.EVENT_NAME,
    EH2.WAIT_TIME_MILLI,
    DECODE(SS.RESTART, 
      'YES', EH2.WAIT_COUNT,
      'NO',  EH2.WAIT_COUNT - EH1.WAIT_COUNT) WAIT_COUNT
  FROM
    B_INFO BI,
    SNAPSHOTS SS,
    EVENT_HISTOGRAM EH1,
    EVENT_HISTOGRAM EH2
  WHERE
    EH2.DBID = SS.DBID AND
    EH1.DBID (+) = EH2.DBID AND
    EH2.INSTANCE_NUMBER = SS.INSTANCE_NUMBER AND
    EH1.INSTANCE_NUMBER (+) = EH2.INSTANCE_NUMBER AND
    SS.SNAP_ID != SS.MIN_SNAP_ID AND
    SS.PREV_SNAP_ID IS NOT NULL AND
    EH2.SNAP_ID = SS.SNAP_ID AND
    EH1.SNAP_ID = SS.PREV_SNAP_ID AND
    EH2.EVENT_NAME = BI.EVENT_NAME AND
    EH1.EVENT_NAME (+) = EH2.EVENT_NAME AND
    EH1.WAIT_TIME_MILLI (+) = EH2.WAIT_TIME_MILLI
) 
SELECT
  'BEGIN TIME: ' || TO_CHAR(MIN(BEGIN_INTERVAL_TIME), 'dd.mm.yyyy hh24:mi:ss') BEGIN_TIME,
  NULL TOTAL_S,
  NULL "   1",
  NULL "   2",
  NULL "   4",
  NULL "   8",
  NULL "  16",
  NULL "  32",
  NULL "  64",
  NULL " 128",
  NULL " 256",
  NULL " 512",
  NULL "1024",
  NULL "2048",
  NULL "MORE"
FROM 
  SNAPSHOTS
UNION ALL
( SELECT 
    'END TIME:   ' || TO_CHAR(MAX(END_INTERVAL_TIME), 'dd.mm.yyyy hh24:mi:ss') BEGIN_TIME,
    NULL TOTAL_S,
    NULL "   1",
    NULL "   2",
    NULL "   4",
    NULL "   8",
    NULL "  16",
    NULL "  32",
    NULL "  64",
    NULL " 128",
    NULL " 256",
    NULL " 512",
    NULL "1024",
    NULL "2048",
    NULL "MORE"
  FROM 
    SNAPSHOTS
)
UNION ALL
( SELECT 
    'INSTANCE: ' || DECODE(INSTANCE_NUMBER, -2, 'ALL', TO_CHAR(INSTANCE_NUMBER)) BEGIN_TIME,
    NULL TOTAL_S,
    NULL "   1",
    NULL "   2",
    NULL "   4",
    NULL "   8",
    NULL "  16",
    NULL "  32",
    NULL "  64",
    NULL " 128",
    NULL " 256",
    NULL " 512",
    NULL "1024",
    NULL "2048",
    NULL "MORE"
  FROM 
    B_INFO
)
UNION ALL
( SELECT 
    'EVENT: ' || EVENT_NAME BEGIN_TIME,
    NULL TOTAL_S,
    NULL "   1",
    NULL "   2",
    NULL "   4",
    NULL "   8",
    NULL "  16",
    NULL "  32",
    NULL "  64",
    NULL " 128",
    NULL " 256",
    NULL " 512",
    NULL "1024",
    NULL "2048",
    NULL "MORE"
  FROM 
    B_INFO
)
UNION ALL
( SELECT 
    NULL BEGIN_TIME,
    NULL TOTAL_S,
    NULL "   1",
    NULL "   2",
    NULL "   4",
    NULL "   8",
    NULL "  16",
    NULL "  32",
    NULL "  64",
    NULL " 128",
    NULL " 256",
    NULL " 512",
    NULL "1024",
    NULL "2048",
    NULL "MORE"
  FROM 
    DUAL
)
UNION ALL
( SELECT
    *
  FROM
  ( SELECT 
      BEGIN_TIME,
      TO_CHAR(TIME_WAITED_S, 9999990) TOTAL_S,
      TO_CHAR("   1", 990) "   1",
      TO_CHAR("   2", 990) "   2",
      TO_CHAR("   4", 990) "   4",
      TO_CHAR("   8", 990) "   8",
      TO_CHAR("  16", 990) "  16",
      TO_CHAR("  32", 990) "  32",
      TO_CHAR("  64", 990) "  64",
      TO_CHAR(" 128", 990) " 128",
      TO_CHAR(" 256", 990) " 256",
      TO_CHAR(" 512", 990) " 512",
      TO_CHAR("1024", 990) "1024",
      TO_CHAR("2048", 990) "2048",
      TO_CHAR("MORE", 990) "MORE"
    FROM
    ( SELECT
        BEGIN_TIME,
        SUM(TIME_WAITED_S) TIME_WAITED_S,
        SUM(DECODE(UPPER_WAIT_TIME_MS, 1, PERCENT, 0)) "   1",
        SUM(DECODE(UPPER_WAIT_TIME_MS, 2, PERCENT, 0)) "   2",
        SUM(DECODE(UPPER_WAIT_TIME_MS, 4, PERCENT, 0)) "   4",
        SUM(DECODE(UPPER_WAIT_TIME_MS, 8, PERCENT, 0)) "   8",
        SUM(DECODE(UPPER_WAIT_TIME_MS, 16, PERCENT, 0)) "  16",
        SUM(DECODE(UPPER_WAIT_TIME_MS, 32, PERCENT, 0)) "  32",
        SUM(DECODE(UPPER_WAIT_TIME_MS, 64, PERCENT, 0)) "  64",
        SUM(DECODE(UPPER_WAIT_TIME_MS, 128, PERCENT, 0)) " 128",
        SUM(DECODE(UPPER_WAIT_TIME_MS, 256, PERCENT, 0)) " 256",
        SUM(DECODE(UPPER_WAIT_TIME_MS, 512, PERCENT, 0)) " 512",
        SUM(DECODE(UPPER_WAIT_TIME_MS, 1024, PERCENT, 0)) "1024",
        SUM(DECODE(UPPER_WAIT_TIME_MS, 2048, PERCENT, 0)) "2048",
        SUM(DECODE(SIGN(UPPER_WAIT_TIME_MS - 3000), 1, PERCENT, 0)) "MORE",
        SORT_ORDER
      FROM
      ( SELECT
          BEGIN_TIME,
          TIME_WAITED_S,
          UPPER_WAIT_TIME_MS,
          RATIO_TO_REPORT(UPPER_WAIT_TIME_MS * 
            DECODE(UPPER_WAIT_TIME_MS, 1, 0.5, 0.75) * TOTAL_WAITS) OVER 
            (PARTITION BY BEGIN_TIME) * 100 PERCENT,
          SORT_ORDER
        FROM
        ( SELECT
            DECODE(BI.AGGREGATE_BY,
              'SNAPSHOT', TO_CHAR(EH.BEGIN_INTERVAL_TIME, 'YYYY-MM-DD HH24:MI:SS'),
              'DAY', TO_CHAR(EH.BEGIN_INTERVAL_TIME, 'YYYY-MM-DD (DY)'),
              'HOUR_OF_DAY', TO_CHAR(EH.BEGIN_INTERVAL_TIME, 'HH24') || ':00',
              'INSTANCE', 'Instance: ' || TO_CHAR(EH.INSTANCE_NUMBER),
              'SS_INST', TO_CHAR(EH.BEGIN_INTERVAL_TIME, 'YYYY-MM-DD HH24:MI:SS') ||
                 ' (Instance: ' || TO_CHAR(EH.INSTANCE_NUMBER) || ')',
              'DAY_INST', TO_CHAR(EH.BEGIN_INTERVAL_TIME, 'YYYY-MM-DD (DY)') ||
                 ' (Instance: ' || TO_CHAR(EH.INSTANCE_NUMBER) || ')',
              'HOD_INST', TO_CHAR(EH.BEGIN_INTERVAL_TIME, 'HH24') || ':00' ||
                 ' (Instance: ' || TO_CHAR(EH.INSTANCE_NUMBER) || ')') BEGIN_TIME,
            EH.WAIT_TIME_MILLI UPPER_WAIT_TIME_MS,
            EH.WAIT_TIME_MILLI * DECODE(EH.WAIT_TIME_MILLI, 1, 0.5, 0.75) * 
              EH.WAIT_COUNT / 1000 TIME_WAITED_S,
            EH.WAIT_COUNT TOTAL_WAITS,
            BI.SORT_ORDER
          FROM
            B_INFO BI,
            EVENT_HISTOGRAM_PER_SNAPSHOT EH
        )
      )
      GROUP BY 
        BEGIN_TIME,
        SORT_ORDER
    )
    ORDER BY
      DECODE(SORT_ORDER, 
        'ASC', BEGIN_TIME, '1'),
      DECODE(SORT_ORDER, 
        'DESC', BEGIN_TIME, '1') DESC
  )
)
));

