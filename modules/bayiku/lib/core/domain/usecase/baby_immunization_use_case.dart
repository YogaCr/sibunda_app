import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/domain/repo/form_field_repo.dart';
import 'package:common/arch/domain/repo/immunization_repo.dart';
import 'package:common/arch/ui/model/immunization.dart';
import 'package:core/domain/model/result.dart';

mixin GetBabyImmunizationConfirmForm {
  Future<Result<List<FormGroupData>>> call();
}

mixin GetBabyImmunizationOverview {
  Future<Result<ImmunizationOverview>> call();
}

mixin GetBabyImmunizationGroupList {
  Future<Result<List<ImmunizationDetailGroup>>> call(String babyNik);
}

mixin ConfirmBabyImmunization {
  Future<Result<bool>> call(String babyNik, ImmunizationConfirmData data);
}


class GetBabyImmunizationConfirmFormImpl with GetBabyImmunizationConfirmForm {
  final FormFieldRepo _repo;
  GetBabyImmunizationConfirmFormImpl(this._repo);
  @override
  Future<Result<List<FormGroupData>>> call() => _repo.getBabyImmunizationFormGroupData();
}

class GetBabyImmunizationOverviewImpl with GetBabyImmunizationOverview {
  final ImmunizationRepo _repo;
  GetBabyImmunizationOverviewImpl(this._repo);
  @override
  Future<Result<ImmunizationOverview>> call() => _repo.getBabyImmunizationOverview();
}

class GetBabyImmunizationGroupListImpl with GetBabyImmunizationGroupList {
  final ImmunizationRepo _repo;
  GetBabyImmunizationGroupListImpl(this._repo);
  @override
  Future<Result<List<ImmunizationDetailGroup>>> call(String babyNik) =>
      _repo.getBabyImmunizationGroupList(babyNik);
}

class ConfirmBabyImmunizationImpl with ConfirmBabyImmunization {
  final ImmunizationRepo _repo;
  ConfirmBabyImmunizationImpl(this._repo);
  @override
  Future<Result<bool>> call(String babyNik, ImmunizationConfirmData data) => _repo.confirmBabyImmunization(babyNik, data);
}