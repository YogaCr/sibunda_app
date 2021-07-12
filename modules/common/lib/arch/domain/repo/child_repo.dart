
import 'package:common/arch/domain/model/child.dart';
import 'package:core/domain/model/result.dart';

import '../dummy_data.dart';


mixin ChildRepo {
  Future<Result<Child>> getChildData(String nik);
  Future<Result<bool>> saveChildData(Child data);
  Future<Result<bool>> saveChildrenData(List<Child> data);
  Future<Result<bool>> saveLastChildBirthDate(DateTime date);
  Future<Result<bool>> saveChildrenCount(int count);
}


class ChildRepoDummy with ChildRepo {
  ChildRepoDummy._();
  static final obj = ChildRepoDummy._();

  @override
  Future<Result<Child>> getChildData(String nik) async => Success(dummyChild);
  @override
  Future<Result<bool>> saveChildData(Child data) async => Success(true);
  @override
  Future<Result<bool>> saveChildrenData(List<Child> data) async => Success(true);
  @override
  Future<Result<bool>> saveLastChildBirthDate(DateTime date) async => Success(true);
  @override
  Future<Result<bool>> saveChildrenCount(int count) async => Success(true);
}