prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 108
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>8298252741918445
,p_default_application_id=>108
,p_default_id_offset=>0
,p_default_owner=>'WKSP_TEAMNOVA'
);
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(9157924085590727)
,p_deinstall_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DROP TABLE Ingredients',
'CASCADE CONSTRAINTS PURGE;',
'DROP TABLE Company',
'CASCADE CONSTRAINTS PURGE;'))
);
wwv_flow_imp.component_end;
end;
/
