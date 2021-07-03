import 'package:common/arch/data/remote/model/kehamilanku_chart_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_form_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_form_warning_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_immunization_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_overview_api_model.dart';
import 'package:common/arch/domain/model/auth.dart';
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
  @POST("/show-weekly-report")
  Future<PregnancyCheckBody> getPregnancyCheckForm(@Body() PregnancyShowCheckBody body);
  @POST("/show-weekly-report-analysis")
  Future<PregnancyCheckFormWarningResponse> getPregnancyCheckWarning(@Body() PregnancyShowCheckBody body);
  @GET("/immunization")
  Future<List<PregnancyImmunizationResponse>> getPregnancyImmunization();

  // ======= Chart =========

  @GET("/graph/tfu")
  Future<List<PregnancyChartTfuResponse>> getPregnancyTfuChart();
  @GET("/graph/djj")
  Future<List<PregnancyChartDjjResponse>> getPregnancyDjjChart();
  @GET("/graph/map")
  Future<List<PregnancyChartMapResponse>> getPregnancyMapChart();
  @GET("/graph/weight")
  Future<List<PregnancyChartWeightResponse>> getPregnancyWeightChart();
}