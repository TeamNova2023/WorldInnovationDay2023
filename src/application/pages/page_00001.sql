prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>8298252741918445
,p_default_application_id=>108
,p_default_id_offset=>0
,p_default_owner=>'WKSP_TEAMNOVA'
);
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Food App'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
,p_last_updated_by=>'MELANIESOPHIE.LEBON@GMAIL.COM'
,p_last_upd_yyyymmddhh24miss=>'20230514200659'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9070565358377934)
,p_plug_name=>'NourishAId'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(8965591163377822)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(9162061657563301)
,p_button_sequence=>40
,p_button_name=>'CALL_GPT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(9032489656377871)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generate recipe with GPT'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8568905654131115)
,p_name=>'NUM_MEALS'
,p_item_sequence=>30
,p_prompt=>'Number of meals required'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(9029805095377868)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'1'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9150591581484501)
,p_name=>'COMPANY'
,p_item_sequence=>20
,p_prompt=>'Select your organisation'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT Name as d, Name as r',
'FROM Company',
'WHERE Type = ''Charity'';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(9029805095377868)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(9150719240484503)
,p_name=>'RESPONSE'
,p_item_sequence=>50
,p_prompt=>'Response'
,p_source=>'apex_json.stringify(:gpt_prompt)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>40
,p_field_template=>wwv_flow_imp.id(9029805095377868)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8569030855131116)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Call OpenAI'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_prompt clob;',
'	l_response clob;',
'	l_anwser clob;',
'	l_body clob;',
'    l_comp varchar2(4000);',
'    l_companies varchar2(4000);',
'    l_charity_ingredients varchar2(4000);',
'    l_company_ingredients varchar2(4000);',
'    l_company_stock clob;',
'    l_charity_id number;',
'',
'BEGIN',
'',
'    SELECT DISTINCT ID ',
'    INTO l_charity_id',
'    FROM COMPANY',
'    WHERE Name=:COMPANY;',
'',
'    SELECT DISTINCT LISTAGG(Name, '','') as d',
'    INTO l_charity_ingredients',
'    FROM Ingredients',
'    WHERE Company_id=l_charity_id;',
'',
'    for comp_id in (SELECT DISTINCT ID FROM Company WHERE Type=''Supermarket'')',
'	loop',
'        l_company_ingredients:='''';',
'        ',
'        SELECT LISTAGG(Name, '','') ',
'        INTO l_company_ingredients',
'        FROM Ingredients',
'        WHERE Company_id=comp_id.id;',
'        SELECT DISTINCT Name ',
'        INTO l_comp',
'        FROM COMPANY',
'        WHERE ID=comp_id.id;',
'',
'	    l_company_stock:=l_company_stock||l_comp||'' has these ingredients:''||l_company_ingredients||''. '';',
'',
'	end loop;',
'',
'',
'    l_prompt:=''Please make a recipe for ''||:NUM_MEALS||'' people. Please use the food from ''||:COMPANY||',
'    '' as much as possible. The food it has is:''||l_charity_ingredients||',
'    ''. You can also use food from the following supermarkets, you must tell me where every item is from. ''||l_company_stock||',
'    ''Only use the ingredients I have given you.'';',
'',
'	apex_web_service.g_request_headers.delete();',
'	apex_web_service.g_request_headers(1).name := ''Content-Type'';',
'	apex_web_service.g_request_headers(1).value := ''application/json'';',
'	apex_web_service.g_request_headers(2).name := ''Authorization'';',
'    apex_web_service.g_request_headers(2).value := ''Bearer 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'';',
'',
'	l_body := ''{',
'  "model": "text-davinci-003",',
'  "prompt": "''|| l_prompt || ''",',
'  "temperature": 0.3,',
'  "max_tokens": 4000,',
'  "top_p": 1,',
'  "frequency_penalty": 0,',
'  "presence_penalty": 0',
'}'';',
'	',
'	l_response := apex_web_service.make_rest_request(',
'		p_url => ''https://api.openai.com/v1/completions'',',
'		p_http_method => ''POST'',',
'		p_body=> l_body',
'	);',
'	',
'	for i in (',
'		select * from json_table(l_response, ''$.choices[*]''',
'		columns (',
'		value varchar2(4000) path ''$.text''',
'		)',
'	))',
'	loop',
'	l_anwser:=l_anwser||i.value;',
'',
'	end loop;',
'	',
'	:RESPONSE := l_anwser;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp.component_end;
end;
/
