import 'package:common/arch/data/remote/model/_common_api_model.dart';
import 'package:common/arch/data/remote/model/baby_immunization_api_model.dart';
import 'package:common/arch/data/remote/model/baby_overview_api_model.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/util/net.dart';
import 'package:common/value/const_values.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'baby_api.g.dart';

@RestApi(baseUrl: Const.ENDPOINT_BABY)
abstract class BabyApi {
  factory BabyApi(SessionData session, { Dio? dio }) => _BabyApi(
    SibDio.getDefaultInstance(preExisting: dio, session: session)
  );

  @GET("/overview")
  Future<BabyHomeResponse> getHomeData();
  @GET("/immunization/{id}")
  Future<List<BabyImmunizationResponse>> getImmunization(@Path("id") String childId);
  @POST("/immunization")
  Future<CommonResponse> sendImmunization(@Body() BabyCreateImmunizationBody body);
}