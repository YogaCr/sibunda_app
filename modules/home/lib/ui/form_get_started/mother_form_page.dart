
import 'package:common/arch/di/db_di.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/arch/ui/widget/form_generic_vm_group_observer.dart';
import 'package:common/arch/ui/widget/form_vm_observer.dart';
import 'package:common/arch/ui/widget/img_pick.dart';
import 'package:common/arch/ui/widget/picker_icon_widget.dart';
import 'package:common/arch/ui/widget/popup_widget.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/form_get_started/mother_form_vm.dart';

class MotherFormPage extends StatelessWidget {
  final PageController? pageControll;
  final FormGroupInterceptor? interceptor;

  MotherFormPage({
    this.pageControll,
    this.interceptor,
  });

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<MotherFormVm>(context);
    return Column(
      children: [
        Text(
          Strings.fill_mother_data,
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 60)),
        LiveDataObserver<ImgData>(
          liveData: vm.imgProfile,
          builder: (ctx, img) => ImgPick(
            pic: img,
            onImgPick: (file) => vm.imgProfile.value = file != null
                ? ImgData.fromXFile(file) : null,
          ),
        ).withMargin(EdgeInsets.only(top: 10, bottom: 20,)),
        FormVmGroupObserver<MotherFormVm>(
          vm: vm,
          showHeader: false,
          interceptor: interceptor,
          pickerIconBuilder: (group, key, data) {
            if(group == 0) {
              switch(key) {
                case Const.KEY_BIRTH_PLACE:
                  return CityPickerIcon(
                    onItemSelected: (city) async {
                      data.value = city;
                    },
                  );
                case Const.KEY_BLOOD_TYPE:
                  return BloodTypePickerIcon(
                    onItemSelected: (bloodType) async {
                      data.value = bloodType?.name;
                    },
                  );
              }
            }
          },
          onSubmit: (ctx, success) {
            if(success) {
              if(pageControll != null) {
                pageControll!.animateToPage(
                  pageControll!.page!.toInt() +1,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              } else {
                HomeRoutes.fatherFormPage.goToPage(context);
              }
            } else {
              showSnackBar(context, "Gagal",);
            }
          },
          submitBtnMargin: EdgeInsets.only(bottom: 15,),
          submitBtnBuilder: (ctx, canProceed) => FloatingActionButton(
            child: Icon(Icons.arrow_forward_rounded,),
            backgroundColor: canProceed == true ? pink_300 : grey,
            onPressed: null, //canProceed == true ? null : () => showSnackBar(context, "Ada yg blum valid"),
          ),
        ),
/*
        ImgPick(imgUrl: "ic_profile.png")
            .withMargin(EdgeInsets.only(top: 10)),
 */
//      BlocMultiFieldFormBuilder<MotherFormBloc>.defaultInputField(),
/*
        BlocFormBuilder<MotherFormBloc>(
          builders: [
            (context, formState, i) => TxtInput(
              label: Strings.name,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
              errorText: Strings.please_enter_your_name,
            ),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.nik,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
              errorText: Strings.field_can_not_be_empty,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.salary,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNumeric,
              errorText: Strings.field_must_be_number,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.jkn,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
              errorText: Strings.field_can_not_be_empty,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.faskes1,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
              errorText: Strings.field_can_not_be_empty,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.faskes_rujukan,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
              errorText: Strings.field_can_not_be_empty,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.blood_type,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
              errorText: Strings.field_can_not_be_empty,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.birth_place,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
              errorText: Strings.field_can_not_be_empty,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.birth_date,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
              errorText: Strings.field_can_not_be_empty,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.education,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
              errorText: Strings.field_can_not_be_empty,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.occupancy,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
              errorText: Strings.field_can_not_be_empty,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.address,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
              errorText: Strings.field_can_not_be_empty,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.phone,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
              errorText: Strings.field_can_not_be_empty,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.puskesmas_domisili,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
              errorText: Strings.field_can_not_be_empty,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
            (context, formState, i) => TxtInput(
              label: Strings.cohort_no,
              textController: bloc.inputTxtList[i],
              textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
              errorText: Strings.field_can_not_be_empty,
            ).withMargin(EdgeInsets.only(top: 20)),
            //Spacer(),
          ],
        ).withMargin(EdgeInsets.only(top: 30)),
 */
/*
        BlocBuilder<MotherFormBloc, BlocFormState>(
            builder: (ctx, formState) {
              if(formState is OnSuccessEndForm) {
                SibRoutes.fatherDataPage.goToPage(context);
              } else {
                String? errorMsg;
                if(formState is OnInvalidForm) {
                  errorMsg = formState.additionalData?.toString();
                } else if(formState is OnErrorSubmission) {
                  errorMsg = "code= ${formState.failure?.code} message= ${formState.failure?.message}";
                }
                if(errorMsg != null)
                  showSnackBar(context, errorMsg);
              }
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
            }),
 */
      ],
    ).insideScroll();
  }
}