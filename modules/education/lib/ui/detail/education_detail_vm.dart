import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/util/times.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:education/core/domain/usecase/education_detail_usecase.dart';

class EducationDetailVm extends AsyncVm {
  static const getDetailKey = "getDetail";

  EducationDetailVm({
    required GetEducationDetail getEducationDetail,
  }): _getEducationDetail = getEducationDetail {
    _detail.observe(this, (data) {
      if(data != null) {
        formatTime(data.date).then((str) {
          _dateStr.value = str;
        });
      } else {
        _dateStr.value = null;
      }
    });
  }

  final GetEducationDetail _getEducationDetail;

  final MutableLiveData<TipsDetail> _detail = MutableLiveData();
  final MutableLiveData<String> _dateStr = MutableLiveData();

  LiveData<TipsDetail> get detail => _detail;
  LiveData<String> get dateStr => _dateStr;

  Tips? _currentTips;

  @override
  List<LiveData> get liveDatas => [_detail, _dateStr];

  void getDetail(Tips data, { bool forceLoad = false }) {
    if(!forceLoad && data == _currentTips) return;
    startJob(getDetailKey, (isActive) async {
      final res = await _getEducationDetail(data);
      if(res is Success<TipsDetail>) {
        final detail = res.data;
        _detail.value = detail;
        _currentTips = data;
        return null;
      }
      return res as Fail;
    });
  }
}