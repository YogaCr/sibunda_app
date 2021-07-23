import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/domain/usecase/auth_usecase.dart';
import 'package:common/arch/domain/usecase/profile_usecase.dart';
import 'package:common/arch/ui/vm/vm_auth.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_vm.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:profile/config/profile_routes.dart';

class ProfileHomeVm extends AsyncAuthVm {
  static const getProfileKey = "getProfile";
  static const logoutKey = "logout";

  ProfileHomeVm({
    BuildContext? context,
    required GetProfile getProfile,
    required GetCurrentEmail getCurrentEmail,
    required Logout logout,
    required ToLoginPage toLoginPage,
  }):
      _getProfile = getProfile,
      _getCurrentEmail = getCurrentEmail,
      _logout = logout,
      _toLoginPage = toLoginPage, super(context: context)
  ;

  final GetProfile _getProfile;
  final GetCurrentEmail _getCurrentEmail;
  final Logout _logout;
  final ToLoginPage _toLoginPage;

  final MutableLiveData<Profile> _profile = MutableLiveData();
  LiveData<Profile> get profile => _profile;

  final MutableLiveData<bool> _onLogout = MutableLiveData();
  LiveData<bool> get onLogout => _onLogout;

  @override
  List<LiveData> get liveDatas => [_profile, _onLogout];

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

  void logout() {
    startJob(logoutKey, (isActive) async {
      final res = await _logout(VarDi.session);
      if(res is Success<bool>) {
        final data = res.data;
        _onLogout.value = data;
      } else {
        _onLogout.value = false;
      }
    });
  }

  void toLoginPage(BuildContext context) {
    _toLoginPage(context: context,); //moduleRoute: ProfileRoutes.obj);
  }
}