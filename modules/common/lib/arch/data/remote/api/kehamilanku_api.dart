import 'package:common/arch/data/remote/model/kehamilanku_form_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_overview_api_model.dart';
import 'package:common/util/_util.dart';
import 'package:common/value/const_values.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'kehamilanku_api.g.dart';

@RestApi(baseUrl: Const.ENDPOINT_PREGNANCY)
abstract class KehamilankuApi {
  factory KehamilankuApi([Dio? dio]) => _KehamilankuApi(dio ?? Dio(SibDio.defaultBaseOptions()));
  @GET("/overview")
  Future<PregnancyHomeResponse> getHomeData();
  @POST("/create-weekly-report")
  Future<PregnancyCreateCheckResponse> sendPregnancyCheckForm(@Body() PregnancyCheckBody body);
  @POST("/show-weekly-report")
  Future<PregnancyCheckBody> getPregnancyCheckForm(@Body() PregnancyShowCheckBody body);
}