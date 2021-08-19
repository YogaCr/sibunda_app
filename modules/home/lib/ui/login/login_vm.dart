import 'package:common/arch/domain/dummy_form_field_data.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/usecase/firebase_usecase.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/foundation.dart';
import 'package:home/core/domain/usecase/_auth_usecase.dart';
import 'package:tuple/tuple.dart';
import 'package:email_validator/email_validator.dart';

class LoginFormVm extends FormVmGroup {
  LoginFormVm({
    required Login login,
    required GetFcmToken getFcmToken,
    required
  }):
    _login = login,
    _getFcmToken = getFcmToken
  {
    init();
  }
  final Login _login;
  final GetFcmToken _getFcmToken;

  @override
  List<LiveData> get liveDatas => [];

  @override
  Future<Result<String>> doSubmitJob() async {
    final respMap = getResponse().responseGroups.values.first;
    final email = respMap[Const.KEY_EMAIL] as String;
    final password = respMap[Const.KEY_PSWD] as String;

    var token = Const.DUMMY_FCM_TOKEN;
    final fcmTokenRes = await _getFcmToken();
    if(fcmTokenRes is Success<String>) {
      token = fcmTokenRes.data;
    } else {
      final msg = "Can't get FCM token from local, register with dummy one.";
      if(!ConfigUtil.isMobileOnly || !kIsWeb) {
        prine(msg);
        return Fail(msg: msg);
      } else {
        prinw(msg);
      }
    }
    final data = LoginData(email: email, password: password, fcmToken: token,);
    final res = await _login(data);
    prind("LoginVm.doSubmitJob() res= $res");
    if(res is Success<SessionData>) {
      return Success("ok");
    }
    return (res as Fail<SessionData>).copy();
    //return fcmTokenRes as Fail<String>;
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async => formDataListToUi(loginFormData);

  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async {
    switch(inputKey) {
      case Const.KEY_EMAIL: return EmailValidator.validate(response);
      //case Const.KEY_PSWD: return response.length >= 8;
    }
    return response.isNotEmpty;
  }
  @override
  String getInvalidMsg(String inputKey, response) {
    switch(inputKey) {
      case Const.KEY_EMAIL: return Strings.please_type_correct_email;
    }
    return defaultInvalidMsg;
  }
}