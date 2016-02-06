WITH   my_scripts   AS
(
           SELECT 'blocking_locks'	            AS script_name	FROM dual
UNION ALL  SELECT 'datafile'	            AS script_name 	FROM dual
UNION ALL  SELECT 'find_sql_text_search_s_id'     AS script_name 	FROM dual
UNION ALL  SELECT 'find_sql_text_sid'            AS script_name 	FROM dual
UNION ALL  SELECT 'find_sql_sid_hash'           AS script_name 	FROM dual
UNION ALL  SELECT 'find_sql_stats'	            AS script_name 	FROM dual
UNION ALL  SELECT 'latchprof'	            AS script_name 	FROM dual
UNION ALL  SELECT 'locks_blocking_j'	    AS script_name 	FROM dual
UNION ALL  SELECT 'metadata_tablespace'         AS script_name 	FROM dual
UNION ALL  SELECT 'sess_active'	            AS script_name 	FROM dual
UNION ALL  SELECT 'sess_all'	            AS script_name 	FROM dual
UNION ALL  SELECT 'sess_by_cpu_active'	    AS script_name 	FROM dual
UNION ALL  SELECT 'sess_by_cpu_all'	            AS script_name 	FROM dual
UNION ALL  SELECT 'sess_stats'	            AS script_name 	FROM dual
UNION ALL  SELECT 'session_wait'	            AS script_name 	FROM dual
UNION ALL  SELECT 'session_wait_active'	    AS script_name 	FROM dual
UNION ALL  SELECT 'session_wait_block_10g'	    AS script_name 	FROM dual
UNION ALL  SELECT 'snapper'	                    AS script_name 	FROM dual
UNION ALL  SELECT 'snapperloop'	            AS script_name 	FROM dual
UNION ALL  SELECT 'tablespace_info'  	    AS script_name 	FROM dual
UNION ALL  SELECT 'tempfile'	            AS script_name 	FROM dual
UNION ALL  SELECT 'waitprof'	            AS script_name 	FROM dual
UNION ALL  SELECT 'xplan_stats2'	            AS script_name 	FROM dual
UNION ALL  SELECT 'xpln'	                    AS script_name 	FROM dual
UNION ALL  SELECT 'xpln_stats'	            AS script_name 	FROM dual
UNION ALL  SELECT 'asm_clients'                 AS script_name 	FROM dual
UNION ALL  SELECT 'asm_diskgroups'              AS script_name 	FROM dual
UNION ALL  SELECT 'asm_disks'                   AS script_name 	FROM dual
UNION ALL  SELECT 'asm_disks_perf'              AS script_name 	FROM dual
UNION ALL  SELECT 'asm_files2'                  AS script_name 	FROM dual
UNION ALL  SELECT 'asm_files'                   AS script_name 	FROM dual
UNION ALL  SELECT 'asm'                         AS script_name 	FROM dual
UNION ALL  SELECT 'asm_alias'                   AS script_name 	FROM dual
UNION ALL  SELECT 'asm_drop_files'              AS script_name 	FROM dual
UNION ALL  SELECT 'asm_files_10g'               AS script_name 	FROM dual
UNION ALL  SELECT 'asm_templates'               AS script_name 	FROM dual
UNION ALL  SELECT 'background_process'          AS script_name 	FROM dual
UNION ALL  SELECT 'datafile_like'               AS script_name 	FROM dual
UNION ALL  SELECT 'sess_user_transactions'      AS script_name 	FROM dual
UNION ALL  SELECT 'sess_query_sql'              AS script_name 	FROM dual
UNION ALL  SELECT 'sess_uncommited_trans_undo'  AS script_name 	FROM dual
UNION ALL  SELECT 'sess_user_sessions'          AS script_name 	FROM dual
UNION ALL  SELECT 'sess_user_stats'             AS script_name 	FROM dual
UNION ALL  SELECT 'sess_user_stats_active'      AS script_name 	FROM dual
UNION ALL  SELECT 'sess_user_trace_file_loc'    AS script_name 	FROM dual
UNION ALL  SELECT 'sess_users_by_cursors'       AS script_name 	FROM dual
UNION ALL  SELECT 'sess_users_by_io'            AS script_name 	FROM dual
UNION ALL  SELECT 'sess_users_by_memory'        AS script_name 	FROM dual
UNION ALL  SELECT 'sess_users_by_transactions'  AS script_name 	FROM dual
UNION ALL  SELECT 'sess_users_sql_active'       AS script_name 	FROM dual
UNION ALL  SELECT 'sess_users_sql_all'          AS script_name 	FROM dual
UNION ALL SELECT  'kellogg_prd_tbs'             AS script_name      FROM dual
UNION ALL SELECT  'kellogg_ts'                  AS script_name      FROM dual
UNION ALL SELECT  'kellogg_prd_tbs_2'           AS script_name      FROM dual
UNION ALL SELECT  'find_ospid_with_sid'         AS script_name      FROM dual
UNION ALL SELECT  'find_sid_with_ospid'         AS script_name      FROM dual
UNION ALL SELECT  'sess_by_logical_read'        AS script_name      FROM dual
UNION ALL SELECT  'sess_by_physical_read'       AS script_name      FROM dual
UNION ALL SELECT  'awr_snapshots_dbtime'        AS script_name      FROM dual
UNION ALL SELECT  'asmm_components'             AS script_name      FROM dual
UNION ALL SELECT  'dba_controlfile_records'     AS script_name      FROM dual
UNION ALL SELECT  'dba_controlfiles'            AS script_name      FROM dual
UNION ALL SELECT  'parameter'                   AS script_name      FROM dual
UNION ALL SELECT  'dba_directories'             AS script_name      FROM dual
UNION ALL SELECT  'dba_invalid_objects'         AS script_name      FROM dual
UNION ALL SELECT  'dba_invalid_objects_summary' AS script_name      FROM dual
UNION ALL SELECT  'datafile_like_round'         AS script_name      FROM dual
UNION ALL SELECT  'dba_jobs'                    AS script_name      FROM dual
UNION ALL SELECT  'dba_object_search'           AS script_name      FROM dual
UNION ALL SELECT  'dba_object_summary'          AS script_name      FROM dual
UNION ALL SELECT  'dba_options_installed'       AS script_name      FROM dual
UNION ALL SELECT  'dba_owner_to_tablespace_segment' AS script_name      FROM dual
UNION ALL SELECT  'all_hidden_parameters'       AS script_name      FROM dual
UNION ALL SELECT  'dba_registry'                AS script_name      FROM dual
UNION ALL SELECT  'dba_segment_summary'         AS script_name      FROM dual
UNION ALL SELECT  'dba_table_info'              AS script_name      FROM dual
UNION ALL SELECT  'segment_file_mapper'         AS script_name      FROM dual
UNION ALL SELECT  'extent_block_mapper'         AS script_name      FROM dual
UNION ALL SELECT  'fra_alerts'                  AS script_name      FROM dual
UNION ALL SELECT  'fra_files'                   AS script_name      FROM dual
UNION ALL SELECT  'fra_status'                  AS script_name      FROM dual
UNION ALL SELECT  'fra_db_log_files'            AS script_name      FROM dual
UNION ALL SELECT  'fra_db_redo_time_matrix'     AS script_name      FROM dual
UNION ALL SELECT  'fra_db_status'               AS script_name      FROM dual
UNION ALL SELECT  'locks_dml_ddl_10g'           AS script_name      FROM dual
UNION ALL SELECT  'locks_dml_lock_time'         AS script_name      FROM dual
UNION ALL SELECT  'perf_event_names'            AS script_name      FROM dual
UNION ALL SELECT  'dba_top_segments'            AS script_name      FROM dual
UNION ALL SELECT  'perf_file_io_efficiency'     AS script_name      FROM dual
UNION ALL SELECT  'perf_file_io'                AS script_name      FROM dual
UNION ALL SELECT  'perf_log_switch_history_bytes_daily_all'         AS script_name      FROM dual
UNION ALL SELECT  'perf_log_switch_history_count_daily_input'       AS script_name      FROM dual
UNION ALL SELECT  'perf_log_switch_history_count_daily_all'         AS script_name      FROM dual
UNION ALL SELECT  'perf_hit_ratio_by_session'   AS script_name      FROM dual
UNION ALL SELECT  'perf_redo_log_contention'    AS script_name      FROM dual
UNION ALL SELECT  'perf_sga_free_pool_memory'   AS script_name      FROM dual
UNION ALL SELECT  'perf_sga_usage_memory'       AS script_name      FROM dual
UNION ALL SELECT  'perf_shared_pool_memory'     AS script_name      FROM dual
UNION ALL SELECT  'perf_objects_wo_statistics'  AS script_name      FROM dual
UNION ALL  SELECT 'rac_waiting_sessions'	    AS script_name 	FROM dual
UNION ALL  SELECT 'rac_sess_users_sql'	        AS script_name 	FROM dual
UNION ALL  SELECT 'rac_sess_users_active'	    AS script_name 	FROM dual
UNION ALL  SELECT 'rac_sess_users'              AS script_name 	FROM dual
UNION ALL  SELECT 'rac_rollback_users'	        AS script_name 	FROM dual
UNION ALL  SELECT 'rac_rollback_segments'	    AS script_name 	FROM dual
UNION ALL  SELECT 'rac_locks_blocking'	        AS script_name 	FROM dual
UNION ALL  SELECT 'rac_instances'               AS script_name 	FROM dual
UNION ALL  SELECT 'perf_top_sql_by_disk_reads'	AS script_name 	FROM dual
UNION ALL  SELECT 'perf_top_sql_by_buffer_gets'	AS script_name 	FROM dual
UNION ALL  SELECT 'perf_top_10_tables'	        AS script_name 	FROM dual
UNION ALL  SELECT 'perf_top_10_procedures'	    AS script_name 	FROM dual
UNION ALL  SELECT 'rman_configuration'  	    AS script_name 	FROM dual
UNION ALL  SELECT 'rman_controlfiles'	        AS script_name 	FROM dual
UNION ALL  SELECT 'rman_progress'        	    AS script_name 	FROM dual
UNION ALL  SELECT 'rman_spfiles'                AS script_name 	FROM dual
UNION ALL  SELECT 'rman_backup_pieces'  	    AS script_name 	FROM dual
UNION ALL  SELECT 'rman_backup_sets'	        AS script_name 	FROM dual
UNION ALL  SELECT 'sec_default_passwords'  	    AS script_name 	FROM dual
UNION ALL  SELECT 'sec_roles'                   AS script_name 	FROM dual
UNION ALL  SELECT 'sec_users'        	        AS script_name 	FROM dual
UNION ALL  SELECT 'rollback_contention'  	    AS script_name 	FROM dual
UNION ALL  SELECT 'rollback_users'   	        AS script_name 	FROM dual
UNION ALL  SELECT 'temp_sort_users'             AS script_name 	FROM dual
UNION ALL  SELECT 'temp_status'        	        AS script_name 	FROM dual
UNION ALL  SELECT 'sp_list'  	                AS script_name 	FROM dual
UNION ALL  SELECT 'temp_sort_segment' 	        AS script_name 	FROM dual
UNION ALL  SELECT 'redo'            	        AS script_name 	FROM dual
UNION ALL  SELECT 'perf_wait_system'   	        AS script_name 	FROM dual
UNION ALL  SELECT 'dba_role_users'     	        AS script_name 	FROM dual
UNION ALL  SELECT 'dba_link'         	        AS script_name 	FROM dual
UNION ALL  SELECT 'near_max_extents'   	        AS script_name 	FROM dual
UNION ALL  SELECT 'unable_extend'      	        AS script_name 	FROM dual
UNION ALL  SELECT 'row_chain'       	        AS script_name 	FROM dual
UNION ALL  SELECT 'system_ts_objects'  	        AS script_name 	FROM dual
UNION ALL  SELECT 'dba_jobs_sys'     	        AS script_name 	FROM dual
UNION ALL  SELECT 'kellogg_ts_symphony'	        AS script_name 	FROM dual
UNION ALL  SELECT 'long_ops'        	        AS script_name 	FROM dual
UNION ALL  SELECT 'latch'            	        AS script_name 	FROM dual
UNION ALL  SELECT 'temp_size'         	        AS script_name 	FROM dual
UNION ALL  SELECT 'temp_sort_users2'   	        AS script_name 	FROM dual
UNION ALL  SELECT 'temp_sort_users_10'   	    AS script_name 	FROM dual
UNION ALL  SELECT 'tablespace_info_gb'   	    AS script_name 	FROM dual
UNION ALL  SELECT 'segment_size'   	            AS script_name 	FROM dual
UNION ALL  SELECT 'schema_size'   	            AS script_name 	FROM dual
UNION ALL  SELECT 'stats_allSchema'   	        AS script_name 	FROM dual
UNION ALL  SELECT 'long_ops2'        	        AS script_name 	FROM dual
UNION ALL  SELECT 'db_size'          	        AS script_name 	FROM dual
UNION ALL  SELECT 'top_ten_segments'   	        AS script_name 	FROM dual
UNION ALL  SELECT 'dba_mv'   	                AS script_name 	FROM dual
UNION ALL  SELECT 'dba_partitions'   	        AS script_name 	FROM dual
UNION ALL  SELECT 'list_all_partition'   	    AS script_name 	FROM dual
UNION ALL  SELECT 'list_all_partition_size'     AS script_name 	FROM dual
UNION ALL  SELECT 'dba_trigger_user'   	        AS script_name 	FROM dual
UNION ALL  SELECT 'dba_trigger_user_table'      AS script_name 	FROM dual
UNION ALL  SELECT 'unusable_index'              AS script_name 	FROM dual
UNION ALL  SELECT 'plan_history'     	        AS script_name 	FROM dual
UNION ALL  SELECT 'current_plan'                AS script_name 	FROM dual
UNION ALL  SELECT 'sql_text'                    AS script_name 	FROM dual
UNION ALL  SELECT 'sess_active_9i'              AS script_name 	FROM dual
UNION ALL  SELECT 'table_stats'                 AS script_name 	FROM dual
UNION ALL  SELECT 'index_stats'                 AS script_name 	FROM dual
UNION ALL  SELECT 'shared_pool_advice_memory'   AS script_name 	FROM dual
UNION ALL  SELECT 'library_cache_memory'        AS script_name 	FROM dual
UNION ALL  SELECT 'db_cache_size_advice_memory' AS script_name 	FROM dual
UNION ALL  SELECT 'dba_profile'                 AS script_name 	FROM dual
UNION ALL  SELECT 'ash_cpu'                     AS script_name 	FROM dual
UNION ALL  SELECT 'ash_waiting'                 AS script_name 	FROM dual
UNION ALL  SELECT 'ash_top_sql'                 AS script_name 	FROM dual
UNION ALL  SELECT 'ash_top_session'             AS script_name 	FROM dual
UNION ALL  SELECT 'sess_load_active'            AS script_name 	FROM dual
UNION ALL  SELECT 'sess_load_active_9i'         AS script_name 	FROM dual
UNION ALL  SELECT 'system_wait'                 AS script_name 	FROM dual
UNION ALL  SELECT 'count_session_wait'          AS script_name 	FROM dual
UNION ALL  SELECT 'whats_changed'               AS script_name 	FROM dual
UNION ALL  SELECT 'awr_plan_change'             AS script_name 	FROM dual
UNION ALL  SELECT 'unstable_plans'              AS script_name 	FROM dual
UNION ALL  SELECT 'sql_text_stats'              AS script_name 	FROM dual
UNION ALL  SELECT 'table_stats2'                AS script_name 	FROM dual
UNION ALL  SELECT 'multi_plan'                  AS script_name 	FROM dual
UNION ALL  SELECT 'flush_sql'                   AS script_name 	FROM dual
UNION ALL  SELECT 'build_bind_vars2'            AS script_name 	FROM dual
UNION ALL  SELECT 'top_5_sql'                   AS script_name 	FROM dual
UNION ALL  SELECT 'sql_text_full'               AS script_name 	FROM dual
UNION ALL  SELECT 'sess_all_9i'                 AS script_name 	FROM dual
UNION ALL  SELECT 'sqlhistory'                  AS script_name 	FROM dual
UNION ALL  SELECT 'time_model_sid'              AS script_name 	FROM dual
UNION ALL  SELECT 'load_profile'                AS script_name 	FROM dual
UNION ALL  SELECT 'metric_last_hour'            AS script_name 	FROM dual
UNION ALL  SELECT 'system_wait_last_60sec'      AS script_name 	FROM dual
UNION ALL  SELECT 'avg_hist_wait_event'         AS script_name 	FROM dual
UNION ALL  SELECT 'sessinfo'                    AS script_name 	FROM dual
UNION ALL  SELECT 'system_wait_real_time'       AS script_name 	FROM dual
UNION ALL  SELECT 'grant'                       AS script_name 	FROM dual
UNION ALL  SELECT 'child_load_time'             AS script_name 	FROM dual
UNION ALL  SELECT 'find_sql_child'              AS script_name 	FROM dual
UNION ALL  SELECT 'find_sql_awr'                AS script_name 	FROM dual
UNION ALL  SELECT 'dba_lobs'                    AS script_name 	FROM dual
UNION ALL  SELECT 'block_change_bct'            AS script_name 	FROM dual
UNION ALL  SELECT 'rman_backup_time'            AS script_name 	FROM dual
UNION ALL  SELECT 'rc_rman_all_db_backup'       AS script_name 	FROM dual
UNION ALL  SELECT 'rman_backup_size'            AS script_name 	FROM dual
UNION ALL  SELECT 'sql_text_full2'              AS script_name 	FROM dual
UNION ALL  SELECT 'feature_usage'               AS script_name 	FROM dual
UNION ALL  SELECT 'rman_info_all'               AS script_name 	FROM dual
UNION ALL  SELECT 'rc_rman_info_all'            AS script_name 	FROM dual
UNION ALL  SELECT 'rc_rman_datafile'            AS script_name 	FROM dual
UNION ALL  SELECT 'rc_rman_cont'                AS script_name 	FROM dual
UNION ALL  SELECT 'rc_rman_arch'                AS script_name 	FROM dual
UNION ALL  SELECT 'sess_single'                 AS script_name 	FROM dual
UNION ALL  SELECT 'sess_wait_all'               AS script_name 	FROM dual
UNION ALL  SELECT 'xplan_by_order'              AS script_name 	FROM dual
UNION ALL  SELECT 'undo_history_size'           AS script_name 	FROM dual
UNION ALL  SELECT 'sysdate'                     AS script_name 	FROM dual
UNION ALL  SELECT 'stat_history'                AS script_name 	FROM dual
UNION ALL  SELECT 'io_latency'                  AS script_name 	FROM dual
UNION ALL  SELECT 'asqlmon_plan'                AS script_name 	FROM dual
UNION ALL  SELECT 'sql_id'                      AS script_name 	FROM dual
)
SELECT	    script_name
FROM	    my_scripts
WHERE       script_name	LIKE nvl('%&script_name_like%', script_name )
order by    script_name
;