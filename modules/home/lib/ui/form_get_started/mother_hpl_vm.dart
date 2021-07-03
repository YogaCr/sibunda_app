import 'package:common/util/times.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:home/core/domain/usecase/form_get_started_usecase.dart';

class MotherHplVm extends AsyncVm {
  static const proceedKey = "proceed";

  MotherHplVm({
    required SaveMotherHpl saveMotherHpl,
  }): _saveMotherHpl = saveMotherHpl {
    _init();
  }
  final SaveMotherHpl _saveMotherHpl;

  final MutableLiveData<DateTime> _hpl = MutableLiveData();
  final MutableLiveData<DateTime> _hpht = MutableLiveData();
  final MutableLiveData<DateTime> _hplRes = MutableLiveData();
  final MutableLiveData<String> _hplResTxt = MutableLiveData();
  final MutableLiveData<bool> _canProceed = MutableLiveData();
  final MutableLiveData<bool> _onSubmit = MutableLiveData();

  final TextEditingController hplTxtControl = TextEditingController();
  final TextEditingController hphtTxtControl = TextEditingController();

  LiveData<DateTime> get hpl => _hpl;
  LiveData<DateTime> get hpht => _hpht;
  LiveData<DateTime> get hplRes => _hplRes;
  LiveData<String> get hplResTxt => _hplResTxt;
  LiveData<bool> get canProceed => _canProceed;
  LiveData<bool> get onSubmit => _onSubmit;

  @override
  List<LiveData> get liveDatas => [_hpl, _hpht, _hplResTxt, _hplRes, _canProceed, _onSubmit];

  void _init() {
    _hplRes.observe(this, (data) {
      if(data != null) {
        formatTime(data).then((str) => _hplResTxt.value = str);
      } else {
        _hplResTxt.value = "-";
      }
      _canProceed.value = data != null;
    });
    _hpl.observe(this, (data) {
      if(data != null) {
        formatTime(data).then((str) =>
          hplTxtControl.text = str
        );
        _hplRes.value = data;
        _hpht.value = null;
      } else {
        hplTxtControl.text = "";
      }
    });
    _hpht.observe(this, (data) {
      if(data != null) {
        formatTime(data).then((str) =>
          hphtTxtControl.text = str
        );
        _hplRes.value = getHpl(data);
        _hpl.value = null;
      } else {
        hphtTxtControl.text = "";
      }
    });
  }

  void proceed() {
    startJob(proceedKey, (isActive) async {
      final hpl = _hplRes.value;
      if(hpl == null) {
        throw "`hpl` == null";
      }
      final res = await _saveMotherHpl(hpl);
      if(res is Success<bool>) {
        final data = res.data;
        _onSubmit.value = data;
      } else {
        return res as Fail;
      }
    });
  }

  void setHpl(DateTime time) {
    _hpl.value = time;
  }
  void setHpht(DateTime time) {
    _hpht.value = time;
  }

  @override
  void dispose() {
    super.dispose();
    hplTxtControl.dispose();
    hphtTxtControl.dispose();
  }
}