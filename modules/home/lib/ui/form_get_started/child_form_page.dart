
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_vm_observer.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/ui.dart';
import 'package:flutter/material.dart';
import 'package:home/ui/form_get_started/child_form_vm.dart';

class ChildFormPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.fill_child_data,
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 60)),
        ImgPick(imgUrl: "ic_profile.png")
            .withMargin(EdgeInsets.only(top: 10)),
        TxtLink(
          Strings.skip,
          onTap: () => showSnackBar(context, "dipencet"),
        ),
        FormTxtVmObserver<ChildFormVm>(
          onSubmit: (success) => success
              ? showSnackBar(context, "Berhasil", backgroundColor: Colors.green)
              : showSnackBar(context, "Gagal",),
          submitBtnBuilder: (ctx, canProceed) => FloatingActionButton(
            child: Icon(Icons.arrow_forward_rounded,),
            backgroundColor: canProceed == true ? pink_300 : grey,
            onPressed: canProceed == true ? null : () => showSnackBar(context, "Masih ada yg blum valid",),
          ),
        ),
        //BlocMultiFieldFormBuilder<ChildFormBloc>.defaultInputField(),
        //BlocFormBuilder<ChildFormBloc>(builders: formBuilders,),
        /*
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
         */
      ],
    ).insideScroll();
  }
}
