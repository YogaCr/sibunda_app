import 'dart:async';

import 'package:common/arch/domain/dummy_form_field_data.dart';
import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/domain/usecase/auth_usecase.dart';
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
  SignUpFormVm({
    required SaveSignUpData saveSignupData,
    required CheckEmailAvailability checkEmailAvailability,
  }):
    _saveSignupData = saveSignupData,
    _checkEmailAvailability = checkEmailAvailability
  {
    init();
    isFormReady.observe(this, (isReady) {
      if(isReady == true) {
        getResponseLiveDataWithKey(Const.KEY_EMAIL).observe(this, (final email) {
          _emailCheckTimer?.cancel();
          prind("getResponseLiveDataWithKey() email= $email");
          if(email == _currentTypedEmail) {
            return;
          }
          _isEmailAvailable.value = false;
          setFieldValidity(0, Const.KEY_EMAIL, false);
          if(email != null) {
            if(!EmailValidator.validate(email)) {
              _isEmailAvailable.value = false;
              return;
            }
            _isEmailAvailable.value = null;
            _emailCheckTimer = Timer(Duration(milliseconds: 2500), () async {
              final res = await _checkEmailAvailability(email!);
              if(res is Success<bool>) {
                _isEmailAvailable.value = res.data;
              } else {
                _isEmailAvailable.value = null; // it means error while checking
              }
              //setResponse(0, Const.KEY_EMAIL, email);
            });
          }
          _currentTypedEmail = email;
        }, distinctUntilChanged: true,);
      }
    }, tag: toString());
    _isEmailAvailable.observe(this, (available) {
      prind("SignUpVm _isEmailAvailable.observe() available= $available");
      setFieldValidity(0, Const.KEY_EMAIL, available == true);
    });
  }
  final SaveSignUpData _saveSignupData;
  final CheckEmailAvailability _checkEmailAvailability;

  Timer? _emailCheckTimer;
  String? _currentTypedEmail;

  LiveData<dynamic>? _pswd_re;

  final MutableLiveData<bool> _isEmailAvailable = MutableLiveData(false);
  LiveData<bool> get isEmailAvailable => _isEmailAvailable;

  final imgProfile = MutableLiveData<ImgData>();

  @override
  List<LiveData> get liveDatas => [imgProfile, _isEmailAvailable];

  @override
  void dispose() {
    _pswd_re?.dispose();
    _emailCheckTimer?.cancel();
    super.dispose();
  }


  @override
  Future<Result<String>> doSubmitJob() async {
    final respMap = getResponse().responseGroups.values.first;
    final name = respMap[Const.KEY_NAME] as String;
    final email = respMap[Const.KEY_EMAIL] as String;
    final password = respMap[Const.KEY_PSWD] as String;
    final data = SignUpData(name: name, email: email, password: password);
    return await _saveSignupData(data).then<Result<String>>(
            (value) => value is Success<bool> ? Success("") : value as Fail<String>
    );
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async => formDataListToUi(signupFormData);

  @override
  void preValidateField(int groupPosition, String inputKey, response) {
    if(inputKey == Const.KEY_EMAIL) {
      if(response != _currentTypedEmail) {
        _isEmailAvailable.value = false;
      }
    }
  }
  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async {
    //print("SignUpBloc.validateTxt() inputKey= $inputKey txt= $txt");
    //print("SignUpBloc.validateTxt() txt == null => ${txt == null}");
    prind("SignUpVm.validateField() groupPosition= $groupPosition inputKey= $inputKey response= $response _isEmailAvailable= $_isEmailAvailable");
    switch(inputKey) {
      case Const.KEY_EMAIL:
        return _isEmailAvailable.value == true && EmailValidator.validate(response);
          //|| _isEmailAvailable.value == null;
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
      case Const.KEY_EMAIL:
        if(!EmailValidator.validate(response)) {
          return Strings.please_type_correct_email;
        }
        if(_isEmailAvailable.value != true) {
          if(_isEmailAvailable.value == false) {
            return Strings.email_already_exists;
          } else {
            return Strings.still_checking_email_availability;
          }
        }
        return Strings.please_type_correct_email;
      case Const.KEY_PSWD: return Strings.password_at_least_8;
      case Const.KEY_RE_PSWD: return Strings.password_re_does_not_match;
    }
    return defaultInvalidMsg;
  }
}