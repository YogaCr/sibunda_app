
import 'package:common/arch/domain/usecase/mother_usecase.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/ui.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/core/domain/usecase/form_get_started_usecase.dart';

class DoMotherHavePregnancyVm extends AsyncVm {
  static const deleteHplKey = "deleteHpl";

  DoMotherHavePregnancyVm({
    required DeleteCurrentMotherHpl deleteCurrentMotherHpl,
  }):
    _deleteCurrentMotherHpl = deleteCurrentMotherHpl
  {
    _onDelete.observe(this, (delete) {
      isHplDeleted = delete == true;
    });
  }

  final DeleteCurrentMotherHpl _deleteCurrentMotherHpl;

  //bool _isHplDeleted = false;
  bool isHplDeleted = false;

  final MutableLiveData<bool> _onDelete = MutableLiveData();
  LiveData<bool> get onDelete => _onDelete;

  @override
  List<LiveData> get liveDatas => [_onDelete];

  void deleteHpl() {
    startJob(deleteHplKey, (isActive) async {
      final res = await _deleteCurrentMotherHpl();
      _onDelete.value = res is Success<bool>;
      if(res is Fail<bool>) {
        return res;
      }
    });
  }
}