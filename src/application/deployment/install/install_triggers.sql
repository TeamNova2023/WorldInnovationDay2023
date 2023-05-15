prompt --application/deployment/install/install_triggers
begin
--   Manifest
--     INSTALL: INSTALL-triggers
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
 p_id=>wwv_flow_imp.id(9822021316420542)
,p_install_id=>wwv_flow_imp.id(9157924085590727)
,p_name=>'triggers'
,p_sequence=>20
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE OR REPLACE EDITIONABLE TRIGGER "COMPANY_BIU" ',
'    before insert or update  ',
'    on company ',
'    for each row ',
'begin ',
'    if inserting then ',
'        :new.created := sysdate; ',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user); ',
'    end if; ',
'    :new.updated := sysdate; ',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user); ',
'end company_biu; ',
'',
'/',
'',
'',
'ALTER TRIGGER "COMPANY_BIU" ENABLE;',
'',
'CREATE OR REPLACE EDITIONABLE TRIGGER "INGREDIENTS_BIU" ',
'    before insert or update  ',
'    on ingredients ',
'    for each row ',
'begin ',
'    if inserting then ',
'        :new.created := sysdate; ',
'        :new.created_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user); ',
'    end if; ',
'    :new.updated := sysdate; ',
'    :new.updated_by := coalesce(sys_context(''APEX$SESSION'',''APP_USER''),user); ',
'end ingredients_biu; ',
'',
'/',
'',
'',
'ALTER TRIGGER "INGREDIENTS_BIU" ENABLE;',
'',
''))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(9822152480420542)
,p_script_id=>wwv_flow_imp.id(9822021316420542)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'COMPANY_BIU'
,p_last_updated_by=>'ASCARFF'
,p_last_updated_on=>to_date('20230515084216','YYYYMMDDHH24MISS')
,p_created_by=>'ASCARFF'
,p_created_on=>to_date('20230515084216','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(9822399249420542)
,p_script_id=>wwv_flow_imp.id(9822021316420542)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TRIGGER'
,p_object_name=>'INGREDIENTS_BIU'
,p_last_updated_by=>'ASCARFF'
,p_last_updated_on=>to_date('20230515084216','YYYYMMDDHH24MISS')
,p_created_by=>'ASCARFF'
,p_created_on=>to_date('20230515084216','YYYYMMDDHH24MISS')
);
wwv_flow_imp.component_end;
end;
/
