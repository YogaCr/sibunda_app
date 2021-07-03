import 'package:common/arch/data/remote/model/data_api_model.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/util/net.dart';
import 'package:common/value/const_values.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'data_api.g.dart';

@RestApi(baseUrl: Const.ENDPOINT_DATA)
abstract class DataApi {
  factory DataApi(SessionData session, { Dio? dio }) => _DataApi(
      SibDio.getDefaultInstance(preExisting: dio, session: session)
  );

  @GET("/kota")
  Future<List<CityResponse>> getCity();
}