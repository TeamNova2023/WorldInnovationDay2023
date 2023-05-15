prompt --workspace/remote_servers/api_openai_com
begin
--   Manifest
--     REMOTE SERVER: api-openai-com
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>8298252741918445
,p_default_application_id=>108
,p_default_id_offset=>0
,p_default_owner=>'WKSP_TEAMNOVA'
);
wwv_imp_workspace.create_remote_server(
 p_id=>wwv_flow_imp.id(9147267127472104)
,p_name=>'api-openai-com'
,p_static_id=>'api_openai_com'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('api_openai_com'),'https://api.openai.com/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('api_openai_com'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('api_openai_com'),'')
,p_remote_sql_default_schema=>nvl(wwv_flow_application_install.get_remote_server_default_db('api_openai_com'),'')
,p_mysql_sql_modes=>nvl(wwv_flow_application_install.get_remote_server_sql_mode('api_openai_com'),'')
,p_prompt_on_install=>false
);
wwv_flow_imp.component_end;
end;
/
