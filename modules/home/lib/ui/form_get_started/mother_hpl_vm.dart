import 'package:common/util/times.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/cupertino.dart';

class MotherHplVm extends AsyncVm {
  MotherHplVm() {
    _init();
  }

  final MutableLiveData<DateTime> _hpl = MutableLiveData();
  final MutableLiveData<DateTime> _hpht = MutableLiveData();
  final MutableLiveData<DateTime> _hplRes = MutableLiveData();
  final MutableLiveData<String> _hplResTxt = MutableLiveData();

  final TextEditingController hplTxtControl = TextEditingController();
  final TextEditingController hphtTxtControl = TextEditingController();

  LiveData<DateTime> get hpl => _hpl;
  LiveData<DateTime> get hpht => _hpht;
  LiveData<DateTime> get hplRes => _hplRes;
  LiveData<String> get hplResTxt => _hplResTxt;

  @override
  List<LiveData> get liveDatas => [_hpl, _hpht, _hplResTxt, _hplRes];

  void _init() {
    _hplRes.observe(this, (data) {
      if(data != null) {
        formatTime(data).then((str) => _hplResTxt.value = str);
      } else {
        _hplResTxt.value = "-";
      }
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