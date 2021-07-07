import 'package:common/arch/data/remote/model/covid_check_api_model.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/util/net.dart';
import 'package:common/value/const_values.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'covid_api.g.dart';

@RestApi(baseUrl: Const.ENDPOINT_COVID)
abstract class CovidApi {
  factory CovidApi(SessionData session, { Dio? dio }) => _CovidApi(
      SibDio.getDefaultInstance(preExisting: dio, session: session)
  );
  @GET("/questionnaire")
  Future<CovidFormResponse> getFormData();
  @POST("/checkup")
  Future<CovidCheckFormResponse> sendFormData(@Body() CovidCheckFormBody body);
  @GET("/checkup")
  Future<CovidCheckHistoryResponse> getHistory();
}