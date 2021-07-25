import 'package:common/arch/domain/model/_model_template.dart';
import 'package:common/arch/domain/usecase/auth_usecase.dart';
import 'package:common/arch/domain/usecase/data_usecase.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';

class SplashVm extends AsyncVm {
  static const downloadCityListKey = "downloadCityList";
  static const checkLogInKey = "checkLogIn";

  SplashVm({
    required GetCityList getCityList,
    required IsLoggedIn isLoggedInUseCase,
    required InitConfig initConfig,
  }):
    _getCityList = getCityList,
    _isLoggedInUseCase = isLoggedInUseCase,
    _initConfig = initConfig
  ;
  final GetCityList _getCityList;
  final IsLoggedIn _isLoggedInUseCase;
  final InitConfig _initConfig;

  final MutableLiveData<List<IdStringModel>> _cityList = MutableLiveData();
  LiveData<List<IdStringModel>> get cityList => _cityList;

  final MutableLiveData<bool> _isLoggedIn = MutableLiveData();
  LiveData<bool> get isLoggedIn => _isLoggedIn;

  final MutableLiveData<bool> _onInitConfig = MutableLiveData();
  LiveData<bool> get onInitConfig => _onInitConfig;

  @override
  List<LiveData> get liveDatas => [_cityList, _isLoggedIn, _onInitConfig,];

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
      prind("SplashVm.checkLogIn() startJob");
      final res = await _isLoggedInUseCase();
      prind("SplashVm.checkLogIn() res = $res");
      if(res is Success<bool>) {
        final isLoggedIn = res.data;
        _isLoggedIn.value = isLoggedIn;

        prind("SplashVm.checkLogIn() _initConfig AWAL");
        final res2 = await _initConfig();
        prind("SplashVm.checkLogIn() _initConfig res2 = $res2");
        if(res2 is Success<bool>) {
          _onInitConfig.value = res2.data;
        } else {
          _onInitConfig.value = false;
        }
        //if(isLoggedIn) {}
        return null;
      }
      return res as Fail;
    });
  }
}