prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 108
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>8298252741918445
,p_default_application_id=>108
,p_default_id_offset=>0
,p_default_owner=>'WKSP_TEAMNOVA'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(9060810385377909)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/
