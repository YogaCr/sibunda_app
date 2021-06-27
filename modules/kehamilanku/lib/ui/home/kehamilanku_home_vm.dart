import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:kehamilanku/core/domain/usecase/home_usecase.dart';

class KehamilankuHomeVm extends AsyncVm {
  static const getAgeOverviewKey = "getAgeOverview";
  static const getTrimesterListKey = "getTrimesterList";
  static const getFoodRecomListKey = "getFoodRecomList";

  KehamilankuHomeVm({
    required GetPregnancyAgeOverview getPregnancyAgeOverview,
    required GetTrimesterList getTrimesterList,
    required GetMotherFoodRecomList  getMotherFoodRecomList,
  }):
      _getPregnancyAgeOverview = getPregnancyAgeOverview,
      _getTrimesterList = getTrimesterList,
      _getMotherFoodRecomList = getMotherFoodRecomList
  ;

  final GetPregnancyAgeOverview _getPregnancyAgeOverview;
  final GetTrimesterList _getTrimesterList;
  final GetMotherFoodRecomList  _getMotherFoodRecomList;

  final MutableLiveData<MotherPregnancyAgeOverview> _ageOverview = MutableLiveData();
  final MutableLiveData<List<MotherTrimester>> _trimesterList = MutableLiveData();
  final MutableLiveData<List<MotherFoodRecom>> _foodRecomList = MutableLiveData();

  LiveData<MotherPregnancyAgeOverview> get ageOverview => _ageOverview;
  LiveData<List<MotherTrimester>> get trimesterList => _trimesterList;
  LiveData<List<MotherFoodRecom>> get foodRecomList => _foodRecomList;

  @override
  List<LiveData> get liveDatas => [_ageOverview, _trimesterList, _foodRecomList,];

  void getAgeOverview(String motherNik, [bool forceLoad = false]) {
    if(!forceLoad && _ageOverview.value != null) return;
    startJob(getAgeOverviewKey, (isActive) async {
      _getPregnancyAgeOverview(motherNik).then((value){
        if(value is Success<MotherPregnancyAgeOverview>) {
          final data = value.data;
          _ageOverview.value = data;
        }
      });
    });
  }
  void getTrimesterList([bool forceLoad = false]) {
    if(!forceLoad && _trimesterList.value != null) return;
    startJob(getTrimesterListKey, (isActive) async {
      _getTrimesterList().then((value){
        if(value is Success<List<MotherTrimester>>) {
          final data = value.data;
          _trimesterList.value = data;
        }
      });
    });
  }
  void getFoodRecomList([bool forceLoad = false]) {
    if(!forceLoad && _trimesterList.value != null) return;
    startJob(getFoodRecomListKey, (isActive) async {
      _getMotherFoodRecomList(0).then((value){ //TODO: weekPregnancyAge
        if(value is Success<List<MotherFoodRecom>>) {
          final data = value.data;
          _foodRecomList.value = data;
        }
      });
    });
  }
}