import 'package:common/arch/data/remote/model/home_dashboard_api_model.dart';
import 'package:common/arch/data/remote/model/home_notif_api_model.dart';
import 'package:common/arch/data/remote/model/home_tips_api_model.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/util/net.dart';
import 'package:common/value/const_values.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'home_api.g.dart';

@RestApi(baseUrl: Const.ENDPOINT_HOME)
abstract class HomeApi {
  factory HomeApi(SessionData session, { Dio? dio }) => _HomeApi(
      SibDio.getDefaultInstance(preExisting: dio, session: session)
  );

  @GET("/index")
  Future<HomeDashboardResponse> getDashboardData();
  @GET("/notifications")
  Future<HomeNotifMsgResponse> getNotifs();
  @GET("/messages")
  Future<HomeNotifMsgResponse> getMessages();

  @GET("/tips-dan-info/carousel")
  Future<TipsResponse> getInfoCarousel();
  @GET("/tips-dan-info/latest")
  Future<TipsResponse> getInfoLatest();
  @GET("/tips-dan-info/{id}")
  Future<TipsDataResponse> getInfoDetail(@Path("id") int id);
}