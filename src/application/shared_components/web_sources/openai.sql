prompt --application/shared_components/web_sources/openai
begin
--   Manifest
--     WEB SOURCE: OpenAI
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>8298252741918445
,p_default_application_id=>108
,p_default_id_offset=>0
,p_default_owner=>'WKSP_TEAMNOVA'
);
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(9473389995102918)
,p_name=>'OpenAI'
,p_static_id=>'OpenAI'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(9471993803102915)
,p_remote_server_id=>wwv_flow_imp.id(9147267127472104)
,p_url_path_prefix=>'v1/completions'
,p_credential_id=>wwv_flow_imp.id(9471611040102914)
,p_attribute_05=>'1'
,p_attribute_08=>'OFFSET'
,p_attribute_10=>'EQUALS'
,p_attribute_11=>'true'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(9473504574102918)
,p_web_src_module_id=>wwv_flow_imp.id(9473389995102918)
,p_operation=>'POST'
,p_url_pattern=>'.'
,p_request_body_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "model": "text-davinci-003",',
'  "prompt": "#PROMPT#",',
'  "temperature": 0.3,',
'  "max_tokens": 256,',
'  "top_p": 1,',
'  "frequency_penalty": 0,',
'  "presence_penalty": 0',
'}'))
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(9502805638295699)
,p_web_src_module_id=>wwv_flow_imp.id(9473389995102918)
,p_web_src_operation_id=>wwv_flow_imp.id(9473504574102918)
,p_name=>'PROMPT'
,p_param_type=>'BODY'
,p_is_required=>false
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(9503269661297901)
,p_web_src_module_id=>wwv_flow_imp.id(9473389995102918)
,p_web_src_operation_id=>wwv_flow_imp.id(9473504574102918)
,p_name=>'Content-Type'
,p_param_type=>'HEADER'
,p_is_required=>false
,p_value=>'application/json'
,p_is_static=>true
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(9503673798299021)
,p_web_src_module_id=>wwv_flow_imp.id(9473389995102918)
,p_web_src_operation_id=>wwv_flow_imp.id(9473504574102918)
,p_name=>'RESPONSE'
,p_param_type=>'BODY'
,p_is_required=>false
,p_direction=>'OUT'
);
wwv_flow_imp.component_end;
end;
/
