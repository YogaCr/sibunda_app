
import 'package:common/configs/routes.dart';
import 'package:common/res/themes/themes.dart';
import 'package:common/ui/widget/basic_widgets.dart';
import 'package:common/util/auth.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:common/values/prefs.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        Prefs.email,
        style: SibTextStyles.header1,
      ),
      TxtBtn(
        "Logout",
        onTap: () async {
          final response = await AuthService.logout();
          if(response.statusCode != 200){
            showSnackBar(context, "Gagal logout karena \n${response.message}");
          } else {
            Routes.signInPage.goToPage(context, clearPrevs: true);
          }
        },
      ),
    ]
  );
}