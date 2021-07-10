import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/remote/api/baby_api.dart';
import 'package:common/arch/data/remote/api/kehamilanku_api.dart';
import 'package:common/arch/data/remote/model/baby_immunization_api_model.dart';
import 'package:common/arch/data/remote/model/kehamilanku_immunization_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/ui/model/dummy_ui_data.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/_consoles.dart';
import 'package:core/util/annotation/data_annotation.dart';

mixin ImmunizationRepo {
  @staticData
  Future<Result<ImmunizationOverview>> getMotherImmunizationOverview();
  @staticData
  Future<Result<ImmunizationOverview>> getBabyImmunizationOverview();
/*
  Future<Result<List<ImmunizationDetail>>> getMotherImmunizationList(String motherNik);
  Future<Result<List<ImmunizationDetail>>> getBabyImmunizationList(String babyNik);
 */

  Future<Result<List<ImmunizationDetailGroup>>> getMotherImmunizationGroupList(String motherNik);
  Future<Result<List<ImmunizationDetailGroup>>> getBabyImmunizationGroupList(String babyNik);

  Future<Result<bool>> confirmMotherImmunization(String motherNik, ImmunizationConfirmData data);
  Future<Result<bool>> confirmBabyImmunization(String babyNik, ImmunizationConfirmData data);
}


class ImmunizationRepoImpl with ImmunizationRepo {
  final KehamilankuApi _pregnancyApi;
  final BabyApi _babyApi;
  final AccountLocalSrc _accountLocalSrc;

  ImmunizationRepoImpl({
    required KehamilankuApi pregnancyApi,
    required BabyApi babyApi,
    required AccountLocalSrc accountLocalSrc,
  }):
    _pregnancyApi = pregnancyApi,
    _babyApi = babyApi,
    _accountLocalSrc = accountLocalSrc
  ;

  @override
  Future<Result<ImmunizationOverview>> getMotherImmunizationOverview() async =>
      Success(motherImmunizationOverview);

  @override
  Future<Result<ImmunizationOverview>> getBabyImmunizationOverview() async =>
      Success(babyImmunizationOverview);
/*
  @override
  Future<Result<List<ImmunizationDetail>>> getMotherImmunizationList(String motherNik) async =>
      Success(motherImmunizationDetailList);
  @override
  Future<Result<List<ImmunizationDetail>>> getBabyImmunizationList(String babyNik) async =>
      Success(babyImmunizationDetailList);
 */

  @override
  Future<Result<List<ImmunizationDetailGroup>>> getMotherImmunizationGroupList(String motherNik) async {
    try {
      final res = await _pregnancyApi.getPregnancyImmunization();
      return Success(ImmunizationDetailGroup.fromPregnancyResponse(res));
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Can't get `List<ImmunizationDetailGroup>` from `KehamilankuApi`.", error: e);
    }
  }
  @override
  Future<Result<List<ImmunizationDetailGroup>>> getBabyImmunizationGroupList(String babyNik) async {
    prind("Repo . getBabyImmunizationGroupList() babyNik = $babyNik");
    try {
      final res1 = await _accountLocalSrc.getChildId(babyNik);
      prind("Repo . getBabyImmunizationGroupList() res1 = $res1 babyNik = $babyNik");
      if(res1 is Success<int>) {
        final childId = res1.data;
        final res2 = await _babyApi.getImmunization(childId);
        return Success(ImmunizationDetailGroup.fromBabyResponse(res2.data));
      }
      res1 as Fail<int>;
      return Fail(msg: res1.msg, code: res1.code, error: res1.error);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Can't get `List<ImmunizationDetailGroup>` from `KehamilankuApi`.", error: e);
    }
  }

  @override
  Future<Result<bool>> confirmMotherImmunization(String motherNik, ImmunizationConfirmData data) async {
    try {
      final body = PregnancyCreateImmunizationBody(
        immunizationId: data.immunization.occurrenceId,
        date: data.date,
        location: data.place,
        pic: "pic", //For now, no pic
      );
      final res = await _pregnancyApi.sendPregnancyImmunization(body);
      if(res.code != 200) {
        return Fail(msg: "msg= ${res.message}; status= ${res.status}", code: res.code,);
      }
      return Success(true);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Can't call `confirmMotherImmunization()`", error: e);
    }
  }
  @override
  Future<Result<bool>> confirmBabyImmunization(String babyNik, ImmunizationConfirmData data) async {
    try {
      if(data.immunization.batchNo == null) {
        throw "`data.immunization.batchNo` can't be null. In `confirmBabyImmunization()`";
      }
      final body = BabyCreateImmunizationBody(
        id: data.immunization.occurrenceId,
        date: data.date,
        location: data.place,
        noBatch: data.immunization.batchNo!,
        pic: "pic", //For now, no pic
      );
      final res = await _babyApi.sendImmunization(body);
      if(res.code != 200) {
        return Fail(msg: "msg= ${res.message}; status= ${res.status}", code: res.code,);
      }
      return Success(true);
    } catch(e, stack) {
      prine(stack);
      return Fail(msg: "Can't call `confirmMotherImmunization()`", error: e);
    }
  }
}

class ImmunizationRepoDummy with ImmunizationRepo {
  ImmunizationRepoDummy._();
  static final obj = ImmunizationRepoDummy._();

  @override
  Future<Result<ImmunizationOverview>> getMotherImmunizationOverview() async =>
      Success(motherImmunizationOverview);

  @override
  Future<Result<ImmunizationOverview>> getBabyImmunizationOverview() async =>
      Success(babyImmunizationOverview);
/*
  @override
  Future<Result<List<ImmunizationDetail>>> getMotherImmunizationList(String motherNik) async =>
      Success(motherImmunizationDetailList);
  @override
  Future<Result<List<ImmunizationDetail>>> getBabyImmunizationList(String babyNik) async =>
      Success(babyImmunizationDetailList);
 */

  @override
  Future<Result<List<ImmunizationDetailGroup>>> getMotherImmunizationGroupList(String motherNik) async =>
      Success(motherImmunizationGroupList);
  @override
  Future<Result<List<ImmunizationDetailGroup>>> getBabyImmunizationGroupList(String babyNik) async =>
      Success(babyImmunizationGroupList);

  @override
  Future<Result<bool>> confirmMotherImmunization(String motherNik, ImmunizationConfirmData data) async => Success(true);
  @override
  Future<Result<bool>> confirmBabyImmunization(String babyNik, ImmunizationConfirmData data) async => Success(true);
}