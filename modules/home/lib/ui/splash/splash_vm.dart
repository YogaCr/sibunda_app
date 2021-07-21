import 'package:common/arch/domain/model/_model_template.dart';
import 'package:common/arch/domain/usecase/auth_usecase.dart';
import 'package:common/arch/domain/usecase/data_usecase.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';

class SplashVm extends AsyncVm {
  static const downloadCityListKey = "downloadCityList";
  static const checkLogInKey = "checkLogIn";

  SplashVm({
    required GetCityList getCityList,
    required IsLoggedIn isLoggedInUseCase,
  }):
    _getCityList = getCityList,
    _isLoggedInUseCase = isLoggedInUseCase
  ;
  final GetCityList _getCityList;
  final IsLoggedIn _isLoggedInUseCase;

  final MutableLiveData<List<IdStringModel>> _cityList = MutableLiveData();
  LiveData<List<IdStringModel>> get cityList => _cityList;

  final MutableLiveData<bool> _isLoggedIn = MutableLiveData();
  LiveData<bool> get isLoggedIn => _isLoggedIn;

  @override
  List<LiveData> get liveDatas => [_cityList, _isLoggedIn];

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
  Future<void> checkLogIn() {
    return startJob(checkLogInKey, (isActive) async {
      final res = await _isLoggedInUseCase();
      if(res is Success<bool>) {
        final data = res.data;
        _isLoggedIn.value = data;
        return null;
      }
      return res as Fail;
    });
  }
}