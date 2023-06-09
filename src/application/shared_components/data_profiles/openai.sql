prompt --application/shared_components/data_profiles/openai
begin
--   Manifest
--     DATA PROFILE: OpenAI
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>8298252741918445
,p_default_application_id=>108
,p_default_id_offset=>0
,p_default_owner=>'WKSP_TEAMNOVA'
);
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(9471993803102915)
,p_name=>'OpenAI'
,p_format=>'JSON'
,p_row_selector=>'choices'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(9472190858102915)
,p_data_profile_id=>wwv_flow_imp.id(9471993803102915)
,p_name=>'TEXT'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>32767
,p_has_time_zone=>false
,p_selector=>'text'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(9472460833102915)
,p_data_profile_id=>wwv_flow_imp.id(9471993803102915)
,p_name=>'INDEX_'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'index'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(9472700929102916)
,p_data_profile_id=>wwv_flow_imp.id(9471993803102915)
,p_name=>'LOGPROBS'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>32767
,p_has_time_zone=>false
,p_selector=>'logprobs'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(9473010533102916)
,p_data_profile_id=>wwv_flow_imp.id(9471993803102915)
,p_name=>'FINISH_REASON'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>32767
,p_has_time_zone=>false
,p_selector=>'finish_reason'
);
wwv_flow_imp.component_end;
end;
/
