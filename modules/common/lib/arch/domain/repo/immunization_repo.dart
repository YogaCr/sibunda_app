import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:core/domain/model/result.dart';

mixin ImmunizationRepo {
  Future<Result<List<ImmunizationDetail>>> getMotherImmunizationList(String motherNik);
  Future<Result<List<ImmunizationDetail>>> getBabyImmunizationList(String babyNik);
}

class ImmunizationRepoDummy with ImmunizationRepo {
  @override
  Future<Result<List<ImmunizationDetail>>> getMotherImmunizationList(String motherNik) async =>
      Success(motherImmunizationDetailList);
  @override
  Future<Result<List<ImmunizationDetail>>> getBabyImmunizationList(String babyNik) async =>
      Success(babyImmunizationDetailList);
}