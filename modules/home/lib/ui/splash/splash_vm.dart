import 'package:common/arch/domain/model/_model_template.dart';
import 'package:common/arch/domain/usecase/data_usecase.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';

class SplashVm extends AsyncVm {
  static const downloadCityListKey = "downloadCityList";

  SplashVm({
    required GetCityList getCityList,
  }):
    _getCityList = getCityList
  ;
  final GetCityList _getCityList;

  final MutableLiveData<List<IdStringModel>> _cityList = MutableLiveData();
  LiveData<List<IdStringModel>> get cityList => _cityList;


  @override
  List<LiveData> get liveDatas => [_cityList];

  Future<void> downloadCityList() {
    return startJob(downloadCityListKey, (isActive) async {
      final res = await _getCityList();
      if(res is Success<List<IdStringModel>>) {
        final data = res.data;
        _cityList.value = data;
        return null;
      }
      return res as Fail;
    });
  }
}