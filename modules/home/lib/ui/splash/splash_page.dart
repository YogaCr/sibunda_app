import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/splash_widget.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/splash/splash_vm.dart';


class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<SplashVm>(context)
      ..onInitConfig.observeOnce((isInitSuccess) {
        if(isInitSuccess == true) {
          HomeRoutes.homePage.goToPage(context, clearPrevs: true);
        }
      }, immediatelyGet: false)
/*
      ..isLoggedIn.observeOnce((isLoggedIn) {
        if(isLoggedIn != true) {
          HomeRoutes.homePage.goToPage(context, clearPrevs: true);
        }
      }, immediatelyGet: false)
 */
    ;

    return SplashScreen(
      child: SplashIconPage(),
      pageBuilder: (ctx) => HomeRoutes.introPage.build(ctx),
      computation: () async {
        await vm.checkLogIn();
        if(vm.isLoggedIn.value != true) {
          await vm.downloadCityList();
        }
      },
    );
  }
}

class SplashIconPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final minLen = screenSize.width <= screenSize.height
        ? screenSize.width : screenSize.height;
    final logoLen = minLen *7 /10;

    final showLoading = MutableLiveData(false);
    Future.delayed(Duration(seconds: 1), () {
      showLoading.value = true;
    });

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Manifest.theme.colorPrimary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: logoLen,
            height: logoLen,
            child: SibImages.resolve(appLogoImgWhite, fit: BoxFit.contain,),
          ),
          SizedBox(height: 15,),
          Text(
            Strings.app_name,
            style: SibTextStyles.size_plus_5.copyWith(color: white),
          ),
          SizedBox(height: 40,),
          LiveDataObserver<bool>(
            liveData: showLoading,
            builder: (ctx, show) => show == true
                ? CircularProgressIndicator(color: white,)
                : defaultEmptyWidget(),
          ),
        ],
      ),
    );
  }
}