prompt --application/deployment/install/install_tables
begin
--   Manifest
--     INSTALL: INSTALL-Tables
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
 p_id=>wwv_flow_imp.id(9818950767125451)
,p_install_id=>wwv_flow_imp.id(9157924085590727)
,p_name=>'Tables'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE TABLE "COMPANY" ',
'   (	"ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 6 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOT NULL ENABLE, ',
'	"NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE, ',
'	"TYPE" VARCHAR2(4000 CHAR), ',
'	"LOCATION" VARCHAR2(4000 CHAR), ',
'	"CREATED" DATE NOT NULL ENABLE, ',
'	"CREATED_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, ',
'	"UPDATED" DATE NOT NULL ENABLE, ',
'	"UPDATED_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, ',
'	 CONSTRAINT "COMPANY_ID_PK" PRIMARY KEY ("ID")',
'  USING INDEX  ENABLE',
'   ) ;',
'',
'CREATE TABLE "INGREDIENTS" ',
'   (	"ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOT NULL ENABLE, ',
'	"COMPANY_ID" NUMBER, ',
'	"NAME" VARCHAR2(255 CHAR) NOT NULL ENABLE, ',
'	"QUANTITY" VARCHAR2(4000 CHAR), ',
'	"CREATED" DATE NOT NULL ENABLE, ',
'	"CREATED_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, ',
'	"UPDATED" DATE NOT NULL ENABLE, ',
'	"UPDATED_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, ',
'	 CONSTRAINT "INGREDIENTS_ID_PK" PRIMARY KEY ("ID")',
'  USING INDEX  ENABLE',
'   ) ;',
'',
'ALTER TABLE "INGREDIENTS" ADD CONSTRAINT "INGREDIENTS_COMPANY_ID_FK" FOREIGN KEY ("COMPANY_ID")',
'	  REFERENCES "COMPANY" ("ID") ON DELETE CASCADE ENABLE;',
'',
''))
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(9819082993125455)
,p_script_id=>wwv_flow_imp.id(9818950767125451)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'COMPANY'
,p_last_updated_by=>'ASCARFF'
,p_last_updated_on=>to_date('20230515075306','YYYYMMDDHH24MISS')
,p_created_by=>'ASCARFF'
,p_created_on=>to_date('20230515075306','YYYYMMDDHH24MISS')
);
wwv_flow_imp_shared.create_install_object(
 p_id=>wwv_flow_imp.id(9819211615125456)
,p_script_id=>wwv_flow_imp.id(9818950767125451)
,p_object_owner=>'#OWNER#'
,p_object_type=>'TABLE'
,p_object_name=>'INGREDIENTS'
,p_last_updated_by=>'ASCARFF'
,p_last_updated_on=>to_date('20230515075306','YYYYMMDDHH24MISS')
,p_created_by=>'ASCARFF'
,p_created_on=>to_date('20230515075306','YYYYMMDDHH24MISS')
);
wwv_flow_imp.component_end;
end;
/
