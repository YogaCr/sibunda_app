import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/ui/bloc/form_vm.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:home/core/domain/usecase/save_child_data_use_case.dart';
import 'package:tuple/tuple.dart';

class ChildFormVm extends FormVm {
  ChildFormVm(this._useCase) : super([
    Tuple2(Const.KEY_NAME, Strings.name),
    Tuple2(Const.KEY_NIK, Strings.nik),
    Tuple2(Const.KEY_JKN, Strings.jkn),
    Tuple2(Const.KEY_BLOOD_TYPE, Strings.blood_type),
    Tuple2(Const.KEY_BIRTH_PLACE, Strings.birth_place),
    Tuple2(Const.KEY_BIRTH_DATE, Strings.birth_date),
    Tuple2(Const.KEY_CHILD_ORDER, Strings.child_order),
    Tuple2(Const.KEY_GENDER, Strings.gender),
    Tuple2(Const.KEY_BIRTH_CERT_NO, Strings.birth_cert_no),
    Tuple2(Const.KEY_JKN_START_DATE, Strings.jkn_start_date),
    Tuple2(Const.KEY_BABY_COHORT_REG, Strings.baby_cohort_no),
    Tuple2(Const.KEY_TODDLER_COHORT_REG, Strings.toddler_cohort_no),
    Tuple2(Const.KEY_HOSPITAL_MEDIC_NO, Strings.hospital_medic_no),
  ]);
  
  final SaveChildData _useCase;

  @override
  Future<Result<String>> doSubmitJob() async {
    final txtMap = getTxtMap(mappedKey: {Const.KEY_CHILD_ORDER}, mapper: (key, txt) => int.parse(txt));
    final data = Child.fromJson(txtMap);
    return await _useCase(data).then<Result<String>>((value) => value is Success<bool> ? Success("") : value as Fail<String>);
  }

  @override
  Future<bool> validateTxt(String inputKey, String txt) async {
    switch(inputKey) {
      case Const.KEY_CHILD_ORDER: return int.tryParse(txt) != null;
    }
    return txt.isNotEmpty;
  }
  
}