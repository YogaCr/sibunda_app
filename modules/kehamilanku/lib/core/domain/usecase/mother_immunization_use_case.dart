import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/domain/repo/immunization_repo.dart';
import 'package:common/arch/ui/model/immunization.dart';
import 'package:core/domain/model/result.dart';

mixin GetMotherImmunizationOverview {
  Future<Result<ImmunizationOverview>> call();
}

mixin GetMotherImmunizationGroupList {
  Future<Result<List<ImmunizationDetailGroup>>> call(String motherNik);
}

mixin ConfirmMotherImmunization {
  Future<Result<bool>> call(String motherNik, ImmunizationDetail data);
}


class GetMotherImmunizationOverviewImpl with GetMotherImmunizationOverview {
  final ImmunizationRepo _repo;
  GetMotherImmunizationOverviewImpl(this._repo);
  @override
  Future<Result<ImmunizationOverview>> call() async => _repo.getMotherImmunizationOverview();
}

class GetMotherImmunizationGroupListImpl with GetMotherImmunizationGroupList {
  final ImmunizationRepo _repo;
  GetMotherImmunizationGroupListImpl(this._repo);
  @override
  Future<Result<List<ImmunizationDetailGroup>>> call(String motherNik) async =>
      _repo.getMotherImmunizationGroupList(motherNik);
}

class ConfirmMotherImmunizationImpl with ConfirmMotherImmunization {
  final ImmunizationRepo _repo;
  ConfirmMotherImmunizationImpl(this._repo);
  @override
  Future<Result<bool>> call(String motherNik, ImmunizationDetail data) async => _repo.confirmMotherImmunization(motherNik, data);
}