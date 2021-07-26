import 'dart:io';

import 'package:common/arch/data/remote/model/_common_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_chart_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_form_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_form_warning_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_immunization_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_overview_api_model.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/util/_util.dart';
import 'package:common/value/const_values.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'kehamilanku_api.g.dart';

@RestApi(baseUrl: Const.ENDPOINT_PREGNANCY)
abstract class KehamilankuApi {
  factory KehamilankuApi(SessionData session, {Dio? dio}) => _KehamilankuApi(
      SibDio.getDefaultInstance(preExisting: dio, session: session)
  );

  @GET("/overview")
  Future<PregnancyHomeResponse> getHomeData();
  @POST("/create-weekly-report")
  Future<PregnancyCreateCheckResponse> sendPregnancyCheckForm(@Body() PregnancyCheckBody body);
  @POST("/create-weekly-report/usg")
  Future<CommonResponse> sendPregnancyCheckUsg(
    @Part(name: "weekly_trisemester_checkup_id") int checkUpId,
    @Part(name: "img_usg") File imgFile,
  );
  @POST("/show-weekly-report")
  Future<PregnancyCheckBody> getPregnancyCheckForm(@Body() PregnancyShowCheckBody body);
  @POST("/show-weekly-report-analysis")
  Future<PregnancyCheckFormWarningResponse> getPregnancyCheckWarning(@Body() PregnancyShowAnalysisBody body);
  @GET("/immunization")
  Future<List<PregnancyImmunizationResponse>> getPregnancyImmunization();
  @POST("/immunization")
  Future<CommonResponse> sendPregnancyImmunization(@Body() PregnancyCreateImmunizationBody body);

  // ======= Chart =========

  @GET("/graph/tfu/{pregnancy_id}")
  Future<MotherTfuChartResponse> getPregnancyTfuChart(@Path("pregnancy_id") int pregnancyId);
  @GET("/graph/djj/{pregnancy_id}")
  Future<MotherDjjChartResponse> getPregnancyDjjChart(@Path("pregnancy_id") int pregnancyId);
  @GET("/graph/map/{pregnancy_id}")
  Future<MotherMapChartResponse> getPregnancyMapChart(@Path("pregnancy_id") int pregnancyId);
  @GET("/graph/mom-weight/{pregnancy_id}")
  Future<MotherBmiChartResponse> getPregnancyWeightChart(@Path("pregnancy_id") int pregnancyId);
}