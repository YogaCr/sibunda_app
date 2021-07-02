import 'package:common/arch/domain/model/auth.dart';
import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/domain/model/father.dart';
import 'package:common/arch/domain/model/mother.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:home/core/domain/usecase/_auth_usecase.dart';
import 'package:home/core/domain/usecase/form_get_started_usecase.dart';
import 'package:home/ui/form_get_started/child_form_vm.dart';
import 'package:home/ui/form_get_started/father_form_vm.dart';
import 'package:home/ui/form_get_started/mother_form_vm.dart';
import 'package:home/ui/signup/sign_up_vm.dart';

///*
class GetStartedFormMainVm extends AsyncVm {
  GetStartedFormMainVm() {
    _signUpFormVm = SignUpFormVm(_signup);
    _motherVm = MotherFormVm(_saveMotherData);
    _fatherVm = FatherFormVm(_saveFatherData);
    _childVm = ChildFormVm(_saveChildData);
  }

  final _SignupImpl _signup = _SignupImpl();
  final _SaveChildDataImpl _saveChildData = _SaveChildDataImpl();
  final _SaveFatherDataImpl _saveFatherData = _SaveFatherDataImpl();
  final _SaveMotherDataImpl _saveMotherData = _SaveMotherDataImpl();

  late final SignUpFormVm _signUpFormVm;
  late final MotherFormVm _motherVm;
  late final FatherFormVm _fatherVm;
  late final ChildFormVm _childVm;

  final MutableLiveData<bool> _onSubmit = MutableLiveData();
  LiveData<bool> get onSubmit => _onSubmit;

  @override
  List<LiveData> get liveDatas => [
    _signup.data,
    _saveMotherData.data,
    _saveFatherData.data,
    _saveChildData.data,
  ];


  

  @override
  void dispose() {
    super.dispose();
    _signUpFormVm.dispose();
    _motherVm.dispose();
    _fatherVm.dispose();
    _childVm.dispose();
  }
}

// */




class _SignupImpl with SignUp {
  final MutableLiveData<SignUpData> _data = MutableLiveData();
  LiveData<SignUpData> get data => _data;

  @override
  Future<Result<bool>> call(SignUpData data) {
    _data.value = data;
    throw Success(true);
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