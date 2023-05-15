prompt --workspace/credentials/credentials_for_openai_2
begin
--   Manifest
--     CREDENTIAL: Credentials for OpenAI (2)
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>8298252741918445
,p_default_application_id=>108
,p_default_id_offset=>0
,p_default_owner=>'WKSP_TEAMNOVA'
);
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(9471611040102914)
,p_name=>'Credentials for OpenAI (2)'
,p_static_id=>'Credentials_for_OpenAI__2_'
,p_authentication_type=>'HTTP_HEADER'
,p_valid_for_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://api.openai.com/',
''))
,p_prompt_on_install=>true
);
wwv_flow_imp.component_end;
end;
/
