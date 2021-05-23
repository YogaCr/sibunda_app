
import 'package:sibunda_app/config/routes.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:common/util/auth.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:common/util/prefs.dart';
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
            SibRoutes.signInPage.goToPage(context, clearPrevs: true);
          }
        },
      ),
    ]
  );
}