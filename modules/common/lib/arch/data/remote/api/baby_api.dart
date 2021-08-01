import 'package:common/arch/data/remote/model/_common_api_model.dart';
import 'package:common/arch/data/remote/model/baby_chart_api_model.dart';
import 'package:common/arch/data/remote/model/baby_check_form_api_model.dart';
import 'package:common/arch/data/remote/model/baby_form_warning_api_model.dart';
import 'package:common/arch/data/remote/model/baby_immunization_api_model.dart';
import 'package:common/arch/data/remote/model/baby_neonatal_form_api_model.dart';
import 'package:common/arch/data/remote/model/baby_overview_api_model.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/model/chart_data_baby.dart';
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

  @GET("/perkembangan-questionnaire/{month}")
  Future<List<BabyCheckDevFormDataResponse>> getDevFormData(@Path("month") int month,);

  @POST("/show-monthly-report")
  Future<BabyMonthlyFormBody> getMonthlyForm(@Body() BabyGetMonthlyFormBody body,);
  @POST("/create-monthly-report")
  Future<CommonResponse> sendMonthlyForm(@Body() BabyMonthlyFormBody body,);

  @POST("/show-monthly-report-analysis")
  Future<BabyFormWarningResponse> getFormWarning(@Body() BabyFormWarningBody body,);

  @POST("/get-neonatus")
  Future<NeonatalResponse> getNeonatalAnswer(@Body() BabyGetMonthlyFormBody body,);
  @POST("/create-neonatus-6-hours")
  Future<CommonResponse> sendNeo6hForm(@Body() Neonatal6HourFormBody body,);
  @POST("/create-neonatus-kn1")
  Future<CommonResponse> sendKn1Form(@Body() NeonatalKn1FormBody body,);
  @POST("/create-neonatus-kn2")
  Future<CommonResponse> sendKn2Form(@Body() NeonatalKn2FormBody body,);
  @POST("/create-neonatus-kn3")
  Future<CommonResponse> sendKn3Form(@Body() NeonatalKn3FormBody body,);

  @GET("/immunization/{id}")
  Future<BabyImmunizationResponse> getImmunization(@Path("id") int childId);
  @POST("/immunization")
  Future<CommonResponse> sendImmunization(@Body() BabyCreateImmunizationBody body);


  //============ Chart ==========

  @GET("/graph/bb-usia/{child_id}")
  Future<BabyWeightChartResponse> getWeightChart(@Path("child_id") int childId,);
  @GET("/graph/pb-usia/{child_id}")
  Future<BabyLenChartResponse> getLenChart(@Path("child_id") int childId,);
  @GET("/graph/bb-pb/{child_id}")
  Future<BabyWeightToLenChartResponse> getWeightToLenChart(@Path("child_id") int childId,);
  @GET("/graph/lingkar-kepala/{child_id}")
  Future<BabyHeadCircumChartResponse> getHeadCircumChart(@Path("child_id") int childId,);
  @GET("/graph/imt/{child_id}")
  Future<BabyBmiChartResponse> getBmiChart(@Path("child_id") int childId,);
  @GET("/graph/kms/{child_id}")
  Future<BabyKmsChartResponse> getKmsChart(@Path("child_id") int childId,);
  @GET("/graph/perkembangan/{child_id}")
  Future<BabyDevChartResponse> getDevChart(@Path("child_id") int childId,);
}