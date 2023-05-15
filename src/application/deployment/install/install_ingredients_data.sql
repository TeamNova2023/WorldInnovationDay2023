prompt --application/deployment/install/install_ingredients_data
begin
--   Manifest
--     INSTALL: INSTALL-Ingredients Data
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>8298252741918445
,p_default_application_id=>108
,p_default_id_offset=>0
,p_default_owner=>'WKSP_TEAMNOVA'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(9820336971171808)
,p_install_id=>wwv_flow_imp.id(9157924085590727)
,p_name=>'Ingredients Data'
,p_sequence=>30
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    --INGREDIENTS: 8/10000 rows exported, APEX$DATA$PKG/INGREDIENTS$759573',
'    apex_data_install.load_supporting_object_data(p_table_name => ''INGREDIENTS'', p_delete_after_install => true );',
'end;'))
);
wwv_flow_imp.component_end;
end;
/
