import 'package:common/arch/domain/model/mother.dart';
import 'package:common/arch/ui/bloc/form_bloc.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:home/core/domain/usecase/save_mother_data_use_case.dart';
import 'package:tuple/tuple.dart';

class MotherFormVm extends FormVm {
  MotherFormVm(this._useCase) : super([
    Tuple2(Const.KEY_NAME, Strings.name),
    Tuple2(Const.KEY_NIK, Strings.nik),
    Tuple2(Const.KEY_SALARY, Strings.salary),
    Tuple2(Const.KEY_JKN, Strings.jkn),
    Tuple2(Const.KEY_FASKES1, Strings.faskes1),
    Tuple2(Const.KEY_FASKES_RUJUKAN, Strings.faskes_rujukan),
    Tuple2(Const.KEY_BLOOD_TYPE, Strings.blood_type),
    Tuple2(Const.KEY_BIRTH_PLACE, Strings.birth_place),
    Tuple2(Const.KEY_BIRTH_DATE, Strings.birth_date),
    Tuple2(Const.KEY_EDUCATION, Strings.education),
    Tuple2(Const.KEY_OCCUPANCY, Strings.occupancy),
    Tuple2(Const.KEY_ADDRESS, Strings.address),
    Tuple2(Const.KEY_PHONE, Strings.phone),
    Tuple2(Const.KEY_PUSKESMAS_DOMISILI, Strings.puskesmas_domisili),
    Tuple2(Const.KEY_COHORT_REG, Strings.cohort_no),
  ]);
  
  final SaveMotherData _useCase;

  @override
  Future<Result<String>> doSubmitJob() async {
    final txtMap = getTxtMap(mappedKey: {Const.KEY_SALARY}, mapper: (key, txt) => double.parse(txt));
    final data = Mother.fromJson(txtMap);
    return await _useCase(data).then<Result<String>>((value) => value is Success ? Success("") : value as Fail<String>);
  }

  @override
  Future<bool> validateTxt(String inputKey, String txt) async {
    switch(inputKey) {
      case Const.KEY_SALARY: return double.tryParse(txt) != null;
    }
    return txt.isNotEmpty;
  }
  
}