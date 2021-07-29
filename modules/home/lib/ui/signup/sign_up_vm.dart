import 'package:common/arch/domain/dummy_form_field_data.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:home/core/domain/usecase/_auth_usecase.dart';
import 'package:tuple/tuple.dart';
import 'package:email_validator/email_validator.dart';


class SignUpFormVm extends FormVmGroup {
  SignUpFormVm(this.useCase) {
    init();
  }
  final SaveSignUpData useCase;

  LiveData<dynamic>? _pswd_re;

  final imgProfile = MutableLiveData<ImgData>();

  @override
  List<LiveData> get liveDatas => [imgProfile,];

  @override
  void dispose() {
    _pswd_re?.dispose();
    super.dispose();
  }


  @override
  Future<Result<String>> doSubmitJob() async {
    final respMap = getResponse().responseGroups.values.first;
    final name = respMap[Const.KEY_NAME] as String;
    final email = respMap[Const.KEY_EMAIL] as String;
    final password = respMap[Const.KEY_PSWD] as String;
    final data = SignUpData(name: name, email: email, password: password);
    return await useCase(data).then<Result<String>>(
            (value) => value is Success<bool> ? Success("") : value as Fail<String>
    );
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async => formDataListToUi(signupFormData);

  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async {
    //print("SignUpBloc.validateTxt() inputKey= $inputKey txt= $txt");
    //print("SignUpBloc.validateTxt() txt == null => ${txt == null}");
    switch(inputKey) {
      case Const.KEY_EMAIL: return EmailValidator.validate(response);
      case Const.KEY_PSWD: return response.length >= 8;
      case Const.KEY_RE_PSWD:
        //final pswd = (_pswd_re ??= getResponseLiveDataWithKey(Const.KEY_PSWD)).value;
        //prind("pswd = $pswd response = $response");
        return response.length >= 8
            && response == (_pswd_re ??= getResponseLiveDataWithKey(Const.KEY_PSWD)).value;
    }
    return response.isNotEmpty;
  }

  @override
  String getInvalidMsg(String inputKey, response) {
    switch(inputKey) {
      case Const.KEY_EMAIL: return Strings.please_type_correct_email;
      case Const.KEY_PSWD: return Strings.password_at_least_8;
      case Const.KEY_RE_PSWD: return Strings.password_re_does_not_match;
    }
    return defaultInvalidMsg;
  }
}

/*
class SignUpFormVm extends FormTxtVm {
  SignUpFormVm(this.useCase) : super(keyLabelList: [
    Tuple2(Const.KEY_NAME, Strings.name),
    Tuple2(Const.KEY_EMAIL, Strings.email),
    Tuple2(Const.KEY_PSWD, Strings.password),
    Tuple2(Const.KEY_RE_PSWD, Strings.password_re),
  ]);

  final SignUp useCase;

  @override
  List<LiveData> get liveDatas => [];

  @override
  Future<bool> validateField(String inputKey, response) async {
    //print("SignUpBloc.validateTxt() inputKey= $inputKey txt= $txt");
    //print("SignUpBloc.validateTxt() txt == null => ${txt == null}");
    switch(inputKey) {
      case Const.KEY_EMAIL: return EmailValidator.validate(response);
      case Const.KEY_PSWD: return response.length >= 8;
      case Const.KEY_RE_PSWD: return response.length >= 8 && response == txtControllerList[2].text;
    }
    return response.isNotEmpty;
  }

  @override
  Future<Result<String>> doSubmitJob() async {
    final name = getTxtController(Const.KEY_NAME).text;
    final email = getTxtController(Const.KEY_EMAIL).text;
    final password = getTxtController(Const.KEY_PSWD).text;
    final data = SignUpData(name: name, email: email, password: password);
    return await useCase(data).then<Result<String>>(
            (value) => value is Success<bool> ? Success("") : value as Fail<String>
    );
  }
}
 */