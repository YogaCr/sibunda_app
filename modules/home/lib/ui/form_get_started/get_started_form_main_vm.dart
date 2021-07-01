import 'package:common/arch/domain/model/child.dart';
import 'package:common/arch/domain/model/father.dart';
import 'package:common/arch/domain/model/mother.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:home/core/domain/usecase/form_get_started_usecase.dart';
import 'package:home/ui/form_get_started/child_form_vm.dart';
import 'package:home/ui/form_get_started/father_form_vm.dart';
import 'package:home/ui/form_get_started/mother_form_vm.dart';

///*
class GetStartedFormMainVm extends AsyncVm {
  GetStartedFormMainVm() {
    _motherVm = MotherFormVm(_saveMotherData);
    _fatherVm = FatherFormVm(_saveFatherData);
    _childVm = ChildFormVm(_saveChildData);
  }

  final _SaveChildDataImpl _saveChildData = _SaveChildDataImpl();
  final _SaveFatherDataImpl _saveFatherData = _SaveFatherDataImpl();
  final _SaveMotherDataImpl _saveMotherData = _SaveMotherDataImpl();

  late final MotherFormVm _motherVm;
  late final FatherFormVm _fatherVm;
  late final ChildFormVm _childVm;

  @override
  List<LiveData> get liveDatas => [];


}

// */




class _SaveChildDataImpl with SaveChildData {
  final MutableLiveData<Child> _data = MutableLiveData();
  LiveData<Child> get data => _data;
  @override
  Future<Result<bool>> call(Child data) async {
    _data.value = data;
    return Success(true);
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