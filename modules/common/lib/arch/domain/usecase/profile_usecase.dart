import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/repo/profile_repo.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/value/db_const.dart';
import 'package:core/domain/model/result.dart';
import 'package:collection/collection.dart';

mixin GetProfile {
  Future<Result<Profile>> call(String email);
}

mixin GetFamilyProfile {
  Future<Result<List<Profile>>> call(String email);
}

mixin GetCurrentEmail {
  Future<Result<String>> call();
}


class GetProfileImpl with GetProfile {
  final ProfileRepo _repo;
  GetProfileImpl(this._repo);

  @override
  Future<Result<Profile>> call(String email) => _repo.getProfile(email);
}

class GetCurrentEmailImpl with GetCurrentEmail {
  final ProfileRepo _repo;
  GetCurrentEmailImpl(this._repo);
  @override
  Future<Result<String>> call() => _repo.getCurrentEmail();
}


class GetFamilyProfileImpl with GetFamilyProfile {
  final ProfileRepo _repo;
  GetFamilyProfileImpl(this._repo);
  @override
  Future<Result<List<Profile>>> call(String email) async {
    final res = await _repo.getFamilyProfile(email);
    if(res is! Success<Map<int, List<Profile>>>) {
      return (res as Fail<Map<int, List<Profile>>>).copy();
    }
    final data = res.data;

    final mother = (data[DbConst.TYPE_MOTHER]?.firstOrNull ?? Profile.empty())
        .copyWithNewName(Strings.mother);
    final father = (data[DbConst.TYPE_FATHER]?.firstOrNull ?? Profile.empty())
        .copyWithNewName(Strings.father);

    final children = data[DbConst.TYPE_CHILD];

    final list = <Profile>[
      mother,
      father,
      if(children?.isNotEmpty == true) ...children!,
    ];
    return Success(list);
  }
}