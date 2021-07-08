import 'package:common/arch/data/local/source/account_local_source.dart';
import 'package:common/arch/data/remote/api/covid_api.dart';
import 'package:common/arch/data/remote/model/covid_check_api_model.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/covid_data.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/ui/model/home_graph_menu.dart';
import 'package:common/util/type_util.dart';
import 'package:core/domain/model/result.dart';
import 'package:flutter/material.dart';

mixin CovidRepo {
  Future<Result<CovidHomeOverview>> getCovidHomeOverview(String motherNik);
  /// Although the type is [HomeGraphMenu], this is for form menu.
  /// It's cuz the view is the same as [ItemBabyGraphMenu].
  Future<Result<List<HomeGraphMenu>>> getCovidFormMenu();
  Future<Result<List<CovidCheckHistory>>> getCovidHomeHistory(String motherNik);
  Future<Result<FormWarningStatus>> submitCovidMotherCheck(String motherNik, Map<int, dynamic> data);
  Future<Result<FormWarningStatus>> submitCovidBabyCheck(String babyNik, Map<int, dynamic> data);
}



class CovidRepoImpl with CovidRepo {
  final CovidApi _api;
  final AccountLocalSrc _accountLocalSrc;

  CovidRepoImpl({
    required CovidApi api,
    required AccountLocalSrc accountLocalSrc,
  }):
    _api = api,
    _accountLocalSrc = accountLocalSrc
  ;

  @override
  Future<Result<CovidHomeOverview>> getCovidHomeOverview(String motherNik) async => Success(covidHomeOverview);

  /// Although the type is [HomeGraphMenu], this is for form menu.
  /// It's cuz the view is the same as [ItemBabyGraphMenu].
  @override
  Future<Result<List<HomeGraphMenu>>> getCovidFormMenu() async => Success(covidHomeMenu);

  @override
  Future<Result<List<CovidCheckHistory>>> getCovidHomeHistory(String motherNik) async {
    final res = await _api.getHistory();
    if(res.code != 200) {
      return Fail(msg: "Can't get Covid history from server. msg = ${res.message} status = ${res.status}", code: res.code);
    }
    final list = res.data.map((e) => CovidCheckHistory.fromResponse(e)).toList(growable: false);
    return Success(list);
  }

  @override
  Future<Result<FormWarningStatus>> submitCovidMotherCheck(String motherNik, Map<int, dynamic> data) async {
    final answers = data.entries.map((e) => CovidCheckQuestionBody(
      q_id: e.key,
      ans: parseInt(e.value), // For now, the values of answers are just 'yes' (1) or 'no' (0).
    )).toList(growable: false);
    final body = CovidCheckFormBody(
      date: DateTime.now().toString(),
      is_ibu: 1,
      anak_id: 0,
      answers: answers,
    );
    final res = await _api.sendFormData(body);
    if(res.code != 200) {
      return Fail(msg: "Can't send Covid form data to server. msg = ${res.message} status = ${res.status}", code: res.code);
    }
    final warning = FormWarningStatus.fromCovidCheckResponse(res.data);
    return Success(warning);
  }

  @override
  Future<Result<FormWarningStatus>> submitCovidBabyCheck(String babyNik, Map<int, dynamic> data) async {
    final res1 = await _accountLocalSrc.getChildId(babyNik);
    if(res1 is Success<int>) {
      final childId = res1.data;
      final answers = data.entries.map((e) => CovidCheckQuestionBody(
        q_id: e.key,
        ans: parseInt(e.value), // For now, the values of answers are just 'yes' (1) or 'no' (0).
      )).toList(growable: false);
      final body = CovidCheckFormBody(
        date: DateTime.now().toString(),
        is_ibu: 0,
        anak_id: childId,
        answers: answers,
      );
      final res = await _api.sendFormData(body);
      if(res.code != 200) {
        return Fail(msg: "Can't send Covid form data to server. msg = ${res.message} status = ${res.status}", code: res.code);
      }
      final warning = FormWarningStatus.fromCovidCheckResponse(res.data);
      return Success(warning);
    } else {
      return Fail(msg: "Can't get `childId` from `AccountLocalSrc` to send Covid form data to server");
    }
  }
}




class CovidRepoDummy with CovidRepo {
  CovidRepoDummy._();
  static final obj = CovidRepoDummy._();

  @override
  Future<Result<CovidHomeOverview>> getCovidHomeOverview(String motherNik) async => Success(covidHomeOverview);

  /// Although the type is [HomeGraphMenu], this is for form menu.
  /// It's cuz the view is the same as [ItemBabyGraphMenu].
  @override
  Future<Result<List<HomeGraphMenu>>> getCovidFormMenu() async => Success(covidHomeMenu);

  @override
  Future<Result<List<CovidCheckHistory>>> getCovidHomeHistory(String motherNik) async => Success(covidHomeCheckHistory);

  @override
  Future<Result<FormWarningStatus>> submitCovidMotherCheck(String motherNik, Map<int, dynamic> data) async =>
      Success(dummyCovidCheckResult_mother);
  @override
  Future<Result<FormWarningStatus>> submitCovidBabyCheck(String babyNik, Map<int, dynamic> data) async =>
      Success(dummyCovidCheckResult_baby);
}

