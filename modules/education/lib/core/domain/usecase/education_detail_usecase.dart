import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/domain/repo/education_repo.dart';
import 'package:core/domain/model/result.dart';

mixin GetEducationDetail {
  Future<Result<TipsDetail>> call(Tips data);
}

class GetEducationDetailImpl with GetEducationDetail {
  final EducationRepo _repo;
  GetEducationDetailImpl(this._repo);
  @override
  Future<Result<TipsDetail>> call(Tips data) => _repo.getEducationDetail(data);
}