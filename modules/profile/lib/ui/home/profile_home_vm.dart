import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/usecase/profile_usecase.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';

class ProfileHomeVm extends AsyncVm {
  static const getProfileKey = "getProfile";

  ProfileHomeVm({
    required GetProfile getProfile,
    required GetCurrentEmail getCurrentEmail,
  }):
      _getProfile = getProfile,
      _getCurrentEmail = getCurrentEmail
  ;

  final GetProfile _getProfile;
  final GetCurrentEmail _getCurrentEmail;

  final MutableLiveData<Profile> _profile = MutableLiveData();
  LiveData<Profile> get profile => _profile;

  @override
  List<LiveData> get liveDatas => [_profile];

  void getProfile({ bool forceLoad = false }) {
    if(!forceLoad && _profile.value != null) return;
    startJob(getProfileKey, (isActive) async {
      final res1 = await _getCurrentEmail();
      if(res1 is Success<String>) {
        final email = res1.data;
        final res2 = await _getProfile(email);
        if(res2 is Success<Profile>) {
          final data = res2.data;
          _profile.value = data;
          return null;
        }
        return res2 as Fail;
      }
      return res1 as Fail;
    });
  }
}