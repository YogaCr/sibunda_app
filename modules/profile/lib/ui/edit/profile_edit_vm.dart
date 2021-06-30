import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/dummy_form_field_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/vm/form_vm_group.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/util/validators.dart';
import 'package:common/value/const_values.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:profile/core/domain/usecase/profile_edit_usecase.dart';

class ProfileEditVm extends FormVmGroup {
  ProfileEditVm({
    required SaveProfile saveProfile,
  }):
    _saveProfile = saveProfile
  ;
  final SaveProfile _saveProfile;

  LiveData? _oldPswd;
  LiveData? _newPswd;
  LiveData? _newPswdRe;

  @override
  List<LiveData> get liveDatas {
    final list = <LiveData>[];
    if(_oldPswd != null) {
      list.add(_oldPswd!);
    }
    if(_newPswd != null) {
      list.add(_newPswd!);
    }
    if(_newPswdRe != null) {
      list.add(_newPswdRe!);
    }
    return list;
  }

  @override
  Future<List<FormUiGroupData>> getFieldGroupList() async => formDataListToUi(editFormData);

  @override
  Future<Result<String>> doSubmitJob() async {
    final respMap = getResponse().responseGroups.values.first;
    final data = AccountData(
      name: respMap[Const.KEY_NAME],
      email: respMap[Const.KEY_EMAIL],
      pswd: respMap[Const.KEY_PSWD],
      img: dummyImg, //TODO: img edit profile msh dummy.
    );
    final oldPswd = respMap[Const.KEY_OLD_PSWD];
    final res = await _saveProfile(data, oldPswd);
    return res is Success<bool> ? Success("ok") : Fail();
  }

  @override
  void onReady() {
    final list = responseGroupList.first;
    (list[Const.KEY_OLD_PSWD]!.isValid as MutableLiveData).value = true;
    (_newPswd = list[Const.KEY_PSWD]!.isValid as MutableLiveData).value = true;
    (_newPswdRe = list[Const.KEY_RE_PSWD]!.isValid as MutableLiveData).value = true;
  }

  @override
  Future<bool> validateField(int groupPosition, String inputKey, response) async {
    if((inputKey == Const.KEY_OLD_PSWD
    || inputKey == Const.KEY_PSWD
    || inputKey == Const.KEY_RE_PSWD)
    && _oldPswd == null
    ) {
      final list = responseGroupList.first;
      _oldPswd = list[Const.KEY_OLD_PSWD]!.response;
      _newPswd = list[Const.KEY_PSWD]!.response;
      _newPswdRe = list[Const.KEY_RE_PSWD]!.response;
    }
    switch(inputKey) {
      case Const.KEY_OLD_PSWD:
        return (_newPswd!.value?.isNotEmpty != true && _newPswdRe!.value?.isNotEmpty != true)
            || response.isNotEmpty;
      case Const.KEY_PSWD:
        return _oldPswd!.value?.isNotEmpty != true
            || validatePswd(_newPswd!.value);
      case Const.KEY_RE_PSWD:
        return _oldPswd!.value?.isNotEmpty != true
            || validatePswdRe(_newPswdRe!.value, _newPswd!.value);
    }
    return (response as String).isNotEmpty;
  }

  @override
  String getInvalidMsg(String inputKey, response) {
    switch(inputKey) {
      case Const.KEY_PSWD: return Strings.password_at_least_8;
      case Const.KEY_RE_PSWD: return Strings.password_re_does_not_match;
    }
    return defaultInvalidMsg;
  }

  void setProfile(Profile data) {
    final list = responseGroupList.first as Map<String, MutableFormVmResponse>;
    list[Const.KEY_NAME]!.response.value = data.name;
    list[Const.KEY_EMAIL]!.response.value = data.email;
  }
}