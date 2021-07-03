import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/domain/model/father.dart';
import 'package:common/arch/domain/model/mother.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';
import 'package:home/core/domain/usecase/_auth_usecase.dart';
import 'package:home/core/domain/usecase/form_get_started_usecase.dart';
import 'package:home/ui/form_get_started/child_form_vm.dart';
import 'package:home/ui/form_get_started/father_form_vm.dart';
import 'package:home/ui/form_get_started/mother_form_vm.dart';
import 'package:home/ui/form_get_started/mother_hpl_vm.dart';
import 'package:home/ui/signup/sign_up_vm.dart';

import 'children_count_vm.dart';

///*
class GetStartedFormMainVm extends AsyncVm {
  static const sendDataKey = "sendData";

  GetStartedFormMainVm({
    required SignUpAndRegisterOtherData signUpAndRegisterOtherData,
  }): _signUpAndRegisterOtherData = signUpAndRegisterOtherData {
    signUpFormVm = SignUpFormVm(_signup);
    motherVm = MotherFormVm(_saveMotherData);
    fatherVm = FatherFormVm(_saveFatherData);
    childVm = ChildFormVm(_saveChildData);
    motherHplVm = MotherHplVm(saveMotherHpl: _saveMotherHpl);
    childrenCountVm = ChildrenCountVm(
      saveChildrenCount: _saveChildrenCount,
      saveLastChildBirthDate: _saveLastChildBirthDate,
    );
  }
  final SignUpAndRegisterOtherData _signUpAndRegisterOtherData;

  final _SignupImpl _signup = _SignupImpl();
  final _SaveChildDataImpl _saveChildData = _SaveChildDataImpl();
  final _SaveFatherDataImpl _saveFatherData = _SaveFatherDataImpl();
  final _SaveMotherDataImpl _saveMotherData = _SaveMotherDataImpl();
  final _SaveMotherHplImpl _saveMotherHpl = _SaveMotherHplImpl();
  final _SaveLastChildBirthDateImpl _saveLastChildBirthDate = _SaveLastChildBirthDateImpl();
  final _SaveChildrenCountImpl _saveChildrenCount = _SaveChildrenCountImpl();

  late final SignUpFormVm signUpFormVm;
  late final MotherFormVm motherVm;
  late final FatherFormVm fatherVm;
  late final ChildFormVm childVm;
  late final MotherHplVm motherHplVm;
  late final ChildrenCountVm childrenCountVm;

  final MutableLiveData<bool> _onSubmit = MutableLiveData();
  LiveData<bool> get onSubmit => _onSubmit;

  @override
  List<LiveData> get liveDatas => [
    _signup.data,
    _saveMotherData.data,
    _saveFatherData.data,
    _saveChildData.data,
    _saveMotherHpl.data,
  ];


  void sendData() {
    prind("sendData()");
    startJob(sendDataKey, (isActive) async {
      final signup = _signup.data.value;
      final mother = _saveMotherData.data.value;
      final father = _saveFatherData.data.value;
      final child = _saveChildData.data.value;
      prind("sendData() Current data (signup=$signup), (mother=$mother), (father=$father), (child=$child)");

      if(signup == null || mother == null || father == null || child == null) {
        throw "`signup`, `mother`, `father`, `child` are both non-nullable.\n Current data (signup=$signup), (mother=$mother), (father=$father), (child=$child)";
      }
      final res = await _signUpAndRegisterOtherData(
        signup: signup,
        mother: mother,
        father: father,
        child: child,
      );
      prind("sendData() res= $res");

      _onSubmit.value = res is Success<bool>;
      if(res is Fail<bool>) {
        return res;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    signUpFormVm.dispose();
    motherVm.dispose();
    fatherVm.dispose();
    childVm.dispose();
    motherHplVm.dispose();
  }
}

// */




class _SignupImpl with SaveSignUpData {
  final MutableLiveData<SignUpData> _data = MutableLiveData();
  LiveData<SignUpData> get data => _data;

  @override
  Future<Result<bool>> call(SignUpData data) async {
    prind("_SignupImpl.call() data= $data");
    _data.value = data;
    return Success(true);
  }
  
}
class _SaveChildDataImpl with SaveChildData {
  final MutableLiveData<Child> _data = MutableLiveData();
  LiveData<Child> get data => _data;
  @override
  Future<Result<bool>> call(Child data) async {
    _data.value = data;
    return Success(true); // We return `Success` in intention cuz, in this context, the 'save' means save locally before collective submission in the end of get started related forms.
  }
}

class _SaveFatherDataImpl with SaveFatherData {
  final MutableLiveData<Father> _data = MutableLiveData();
  LiveData<Father> get data => _data;
  @override
  Future<Result<bool>> call(Father data) async {
    _data.value = data;
    return Success(true);
  }
}

class _SaveMotherDataImpl with SaveMotherData {
  final MutableLiveData<Mother> _data = MutableLiveData();
  LiveData<Mother> get data => _data;
  @override
  Future<Result<bool>> call(Mother data) async {
    _data.value = data;
    return Success(true);
  }
}

class _SaveMotherHplImpl with SaveMotherHpl {
  final MutableLiveData<DateTime> _data = MutableLiveData();
  LiveData<DateTime> get data => _data;
  @override
  Future<Result<bool>> call(DateTime date) async {
    _data.value = date;
    return Success(true);
  }
}

class _SaveLastChildBirthDateImpl with SaveLastChildBirthDate {
  final MutableLiveData<DateTime> _data = MutableLiveData();
  LiveData<DateTime> get data => _data;
  @override
  Future<Result<bool>> call(DateTime date) async {
    _data.value = date;
    return Success(true);
  }
}

class _SaveChildrenCountImpl with SaveChildrenCount {
  final MutableLiveData<int> _data = MutableLiveData();
  LiveData<int> get data => _data;
  @override
  Future<Result<bool>> call(int count) async {
    _data.value = count;
    return Success(true);
  }
}