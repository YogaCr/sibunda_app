
import 'package:common/bloc/_bloc.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:common/ui/widget/_intermediate_widget.dart';
import 'package:common/ui/widget/bloc/BlocFormBuilder.dart';
import 'package:flutter/material.dart';
import 'package:sibunda_app/bloc/family_form_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:common/util/functions/txt_ext.dart';

class ChildDataPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ChildFormBloc>(context);
/*
    final formBuilders = List.generate(13, (index) => (context, formState, i) => TxtInput(
      label: Strings.name,
      textController: bloc.inputTxtList[i],
      textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty, //TODO form tuk child
      errorText: Strings.field_can_not_be_empty,
    ),);
 */

    return Column(
      children: [
        Text(
          Strings.fill_father_data,
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 60)),
        ImgPick(imgUrl: "ic_profile.png")
            .withMargin(EdgeInsets.only(top: 10)),
        TxtLink(
          Strings.skip,
          onTap: () => showSnackBar(context, "dipencet"),
        ),
        BlocMultiFieldFormBuilder<ChildFormBloc>.defaultInputField(),
        //BlocFormBuilder<ChildFormBloc>(builders: formBuilders,),
        BlocBuilder<ChildFormBloc, BlocFormState>(
          builder: (ctx, formState) {
            return FloatingActionButton(
                child: Icon(
                  Icons.arrow_forward_rounded,
                ),
                backgroundColor: bloc.canProceed ? pink_300 : grey,
                onPressed: () async {
                  if(bloc.canProceed) {
                    bloc.submitForm();
                  } else {
                    showSnackBar(context, Strings.please_check_the_wrong_field);
                  }
/*
                  if(bloc.canProceed){
                    final response = await AuthService.signUp(nameTextController.text, emailTextController.text, pswdTextController.text);
                    var errorMsg = "Ada error bro!";
                    if(response.statusCode == 200){
                      final response2 = await AuthService.login(emailTextController.text, pswdTextController.text);
                      if(response2.statusCode == 200){
                        SibRoutes.homePage.goToPage(context, clearPrevs: true);
                        return;
                      } else {
                        errorMsg = "$errorMsg \nDi login, msg= ${response2.message}";
                      }
                    } else {
                      if(response.statusCode == 500){
                        final data = response.data.toString();
                        if(data.contains("duplicate key value violates unique constraint")){
                          errorMsg = "Email ${emailTextController.text} sudah ada.";
                          setState(() {
                            isEmailValid = false;
                            isEmailAvailable = false;
                            existingPrevEmail = emailTextController.text;
                          });
                        } else {
                          errorMsg = "code= ${response.statusCode} message= ${response.message}";
                        }
                      }
                      //errorMsg = "$errorMsg \nDi signup, msg= ${response.message}";
                    }
                    showSnackBar(context, errorMsg);
                  } else {
                    showSnackBar(context, "Mohon cek isian yang salah.");
                  }
 */
                }
            ).withMargin(EdgeInsets.only(top: 30));
          },
        ),
      ],
    );
  }
}