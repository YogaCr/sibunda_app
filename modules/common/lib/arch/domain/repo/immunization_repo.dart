import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/ui/model/dummy_ui_data.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/util/annotation/data_annotation.dart';

mixin ImmunizationRepo {
  @staticData
  Future<Result<ImmunizationOverview>> getMotherImmunizationOverview();
  @staticData
  Future<Result<ImmunizationOverview>> getBabyImmunizationOverview();

  Future<Result<List<ImmunizationDetail>>> getMotherImmunizationList(String motherNik);
  Future<Result<List<ImmunizationDetail>>> getBabyImmunizationList(String babyNik);

  Future<Result<List<ImmunizationDetailGroup>>> getMotherImmunizationGroupList(String motherNik);
  Future<Result<List<ImmunizationDetailGroup>>> getBabyImmunizationGroupList(String babyNik);

  Future<Result<bool>> confirmMotherImmunization(String motherNik, ImmunizationConfirmData data);
  Future<Result<bool>> confirmBabyImmunization(String babyNik, ImmunizationDetail data);
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

  @override
  Future<Result<List<ImmunizationDetail>>> getMotherImmunizationList(String motherNik) async =>
      Success(motherImmunizationDetailList);
  @override
  Future<Result<List<ImmunizationDetail>>> getBabyImmunizationList(String babyNik) async =>
      Success(babyImmunizationDetailList);

  @override
  Future<Result<List<ImmunizationDetailGroup>>> getMotherImmunizationGroupList(String motherNik) async =>
      Success(motherImmunizationGroupList);
  @override
  Future<Result<List<ImmunizationDetailGroup>>> getBabyImmunizationGroupList(String babyNik) async =>
      Success(babyImmunizationGroupList);

  @override
  Future<Result<bool>> confirmMotherImmunization(String motherNik, ImmunizationConfirmData data) async => Success(true);
  @override
  Future<Result<bool>> confirmBabyImmunization(String babyNik, ImmunizationDetail data) async => Success(true);
}