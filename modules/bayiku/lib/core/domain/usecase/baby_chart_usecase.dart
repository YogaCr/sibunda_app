
import 'package:common/arch/domain/model/chart_data_baby.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/repo/chart_baby_repo.dart';
import 'package:core/domain/model/result.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


mixin GetBabyWeightChart {
	Future<Result<List<BabyWeightChartData>>> call(String babyNik);
}
mixin GetBabyKmsChart {
	Future<Result<List<BabyKmsChartData>>> call(String babyNik);
}
mixin GetBabyLenChart {
	Future<Result<List<BabyLenChartData>>> call(String babyNik);
}
mixin GetBabyWeightToLenChart {
	Future<Result<List<BabyWeightToLenChartData>>> call(String babyNik);
}
mixin GetBabyHeadCircumChart {
	Future<Result<List<BabyHeadCircumChartData>>> call(String babyNik);
}
mixin GetBabyBmiChart {
	Future<Result<List<BabyBmiChartData>>> call(String babyNik);
}
mixin GetBabyDevChart {
	Future<Result<List<BabyDevChartData>>> call(String babyNik);
}

mixin GetBabyWeightChartWarning {
	Future<Result<List<FormWarningStatus>>> call(String babyNik);
}
mixin GetBabyKmsChartWarning {
	Future<Result<List<FormWarningStatus>>> call(String babyNik);
}
mixin GetBabyLenChartWarning {
	Future<Result<List<FormWarningStatus>>> call(String babyNik);
}
mixin GetBabyWeightToLenChartWarning {
	Future<Result<List<FormWarningStatus>>> call(String babyNik);
}
mixin GetBabyHeadCircumChartWarning {
	Future<Result<List<FormWarningStatus>>> call(String babyNik);
}
mixin GetBabyBmiChartWarning {
	Future<Result<List<FormWarningStatus>>> call(String babyNik);
}
mixin GetBabyDevChartWarning {
	Future<Result<List<FormWarningStatus>>> call(String babyNik);
}



class GetBabyWeightChartImpl with GetBabyWeightChart {
  final BabyChartRepo _repo;
  GetBabyWeightChartImpl(this._repo);
  @override
	Future<Result<List<BabyWeightChartData>>> call(String babyNik) => _repo.getBabyWeightChartData(babyNik);
}
class GetBabyKmsChartImpl with GetBabyKmsChart {
	final BabyChartRepo _repo;
	GetBabyKmsChartImpl(this._repo);
	@override
	Future<Result<List<BabyKmsChartData>>> call(String babyNik) => _repo.getBabyKmsChartData(babyNik);
}
class GetBabyLenChartImpl with GetBabyLenChart {
	final BabyChartRepo _repo;
	GetBabyLenChartImpl(this._repo);
	@override
	Future<Result<List<BabyLenChartData>>> call(String babyNik) => _repo.getBabyLenChartData(babyNik);
}
class GetBabyWeightToLenChartImpl with GetBabyWeightToLenChart {
	final BabyChartRepo _repo;
	GetBabyWeightToLenChartImpl(this._repo);
	@override
	Future<Result<List<BabyWeightToLenChartData>>> call(String babyNik) => _repo.getBabyWeightToLenChartData(babyNik);
}
class GetBabyHeadCircumChartImpl with GetBabyHeadCircumChart {
	final BabyChartRepo _repo;
	GetBabyHeadCircumChartImpl(this._repo);
	@override
	Future<Result<List<BabyHeadCircumChartData>>> call(String babyNik) => _repo.getBabyHeadCircumChartData(babyNik);
}
class GetBabyBmiChartImpl with GetBabyBmiChart {
	final BabyChartRepo _repo;
	GetBabyBmiChartImpl(this._repo);
	@override
	Future<Result<List<BabyBmiChartData>>> call(String babyNik) => _repo.getBabyBmiChartData(babyNik);
}
class GetBabyDevChartImpl with GetBabyDevChart {
	final BabyChartRepo _repo;
	GetBabyDevChartImpl(this._repo);
	@override
	Future<Result<List<BabyDevChartData>>> call(String babyNik) => _repo.getBabyDevChartData(babyNik);
}

class GetBabyWeightChartWarningImpl with GetBabyWeightChartWarning {
	final BabyChartRepo _repo;
	GetBabyWeightChartWarningImpl(this._repo);
	@override
	Future<Result<List<FormWarningStatus>>> call(String babyNik) => _repo.getBabyWeightChartWarning(babyNik);
}
class GetBabyKmsChartWarningImpl with GetBabyKmsChartWarning {
	final BabyChartRepo _repo;
	GetBabyKmsChartWarningImpl(this._repo);
	@override
	Future<Result<List<FormWarningStatus>>> call(String babyNik) => _repo.getBabyKmsChartWarning(babyNik);
}
class GetBabyLenChartWarningImpl with GetBabyLenChartWarning {
	final BabyChartRepo _repo;
	GetBabyLenChartWarningImpl(this._repo);
	@override
	Future<Result<List<FormWarningStatus>>> call(String babyNik) => _repo.getBabyLenChartWarning(babyNik);
}
class GetBabyWeightToLenChartWarningImpl with GetBabyWeightToLenChartWarning {
	final BabyChartRepo _repo;
	GetBabyWeightToLenChartWarningImpl(this._repo);
	@override
	Future<Result<List<FormWarningStatus>>> call(String babyNik) => _repo.getBabyWeightToLenChartWarning(babyNik);
}
class GetBabyHeadCircumChartWarningImpl with GetBabyHeadCircumChartWarning {
	final BabyChartRepo _repo;
	GetBabyHeadCircumChartWarningImpl(this._repo);
	@override
	Future<Result<List<FormWarningStatus>>> call(String babyNik) => _repo.getBabyHeadCircumChartWarning(babyNik);
}
class GetBabyBmiChartWarningImpl with GetBabyBmiChartWarning {
	final BabyChartRepo _repo;
	GetBabyBmiChartWarningImpl(this._repo);
	@override
	Future<Result<List<FormWarningStatus>>> call(String babyNik) => _repo.getBabyBmiChartWarning(babyNik);
}
class GetBabyDevChartWarningImpl with GetBabyDevChartWarning {
	final BabyChartRepo _repo;
	GetBabyDevChartWarningImpl(this._repo);
	@override
	Future<Result<List<FormWarningStatus>>> call(String babyNik) => _repo.getBabyDevChartWarning(babyNik);
}