
import 'package:common/bloc/_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibunda_app/bloc/auth_form_bloc.dart';
import 'package:sibunda_app/config/routes.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:common/util/auth.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:common/util/prefs.dart';
import 'package:common/value/const_values.dart';
import 'package:common/data/dummy_data.dart';
import 'package:flutter/cupertino.dart';

class HomePage_Old extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LogoutFormBloc>(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Halo bro", //Prefs.email,
            style: SibTextStyles.header1,
          ),
          BlocBuilder<LogoutFormBloc, BlocFormState>(
              builder: (ctx, formState) {
                if(formState is OnSuccessEndForm){
                  WidgetsBinding.instance?.addPostFrameCallback((timeStamp) =>
                      SibRoutes.signInPage.goToPage(context, clearPrevs: true));
                } else if(formState is OnErrorSubmission) {
                  showSnackBar(context, "Gagal logout karena \n${formState.failure}");
                }
                return TxtBtn(
                  "Logout",
                  onTap: () async {
                    bloc.submitForm({ Const.KEY_ACCESS_TOKEN : dummyAccessToken });
/*
              final response = await AuthService.logout();
              if(response.statusCode != 200){
                showSnackBar(context, "Gagal logout karena \n${response.message}");
              } else {
                SibRoutes.signInPage.goToPage(context, clearPrevs: true);
              }
 */
                  },
                );
              },
          ),
        ]
    );
  }
}