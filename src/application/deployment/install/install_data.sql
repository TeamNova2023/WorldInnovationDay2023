prompt --application/deployment/install/install_data
begin
--   Manifest
--     INSTALL: INSTALL-data
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
 p_id=>wwv_flow_imp.id(9822552794425916)
,p_install_id=>wwv_flow_imp.id(9157924085590727)
,p_name=>'data'
,p_sequence=>30
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into company (name, type, location) values (''Tesco'', ''Supermarket'', ''London'');',
'insert into company (name, type, location) values (''Organisation_B'', ''Charity'', ''Paris'');',
'insert into company (name, type, location) values (''Sainsburys'', ''Supermarket'', ''London'');',
'insert into company (name, type, location) values (''Organisation_A'', ''Charity'', ''London'');',
'',
'insert into ingredients (company_id, name, quantity) values ((select id from company where name = ''Organisation_A''), ''Salt'',''100'');',
'insert into ingredients (company_id, name, quantity) values ((select id from company where name = ''Organisation_A''), ''Peas'',''40'');',
'insert into ingredients (company_id, name, quantity) values ((select id from company where name = ''Sainsburys''), ''Baked Beans'',''30'');',
'insert into ingredients (company_id, name, quantity) values ((select id from company where name = ''Sainsburys''), ''Carrots'',''45'');',
'insert into ingredients (company_id, name, quantity) values ((select id from company where name = ''Organisation_A''), ''Pepper'',''50'');',
'insert into ingredients (company_id, name, quantity) values ((select id from company where name = ''Tesco''), ''Chicken'',''4'');',
'insert into ingredients (company_id, name, quantity) values ((select id from company where name = ''Sainsburys''), ''Potato'',''50'');',
'insert into ingredients (company_id, name, quantity) values ((select id from company where name = ''Organisation_A''), ''Olive oil'',''10'');',
''))
);
wwv_flow_imp.component_end;
end;
/
