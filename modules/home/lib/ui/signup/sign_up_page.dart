
import 'package:common/core/ui/widget/form_bloc_observer.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:common/ui/widget/_intermediate_widget.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:common/bloc/form_bloc.dart';
import 'package:common/ui/widget/bloc/BlocFormBuilder.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:common/res/string/_string.dart';
import 'package:home/ui/signup/sign_up_bloc.dart';




//TODO 22 May 2021: Terapkan pattern provider atau BLOC
class SignUpPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //final bloc = ViewModelProvider.of<SignUpFormBloc>(context);
    return Column(
      children: [
        Text(
          Strings.make_new_mother_account,
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 60)),
        ImgPick(imgUrl: "ic_profile.png", package: "common",)
            .withMargin(EdgeInsets.only(top: 10)),
        FormBlocObserver<SignUpFormBloc>(
          onSubmit: (canProceed) => canProceed
              ? showSnackBar(context, "Berhasil", backgroundColor: Colors.green)
              : showSnackBar(context, "Gagal", backgroundColor: Colors.red),
          preSubmitBtnBuilder: (ctx, key) => Container(
            padding: EdgeInsets.all(10),
            color: Colors.yellow,
            child: Text("Sending..."),
          ),
          submitBtnBuilder: (ctx, canProceed) => FloatingActionButton(
            backgroundColor: canProceed ? pink_300 : grey,
            onPressed: () => canProceed
                ? showSnackBar(context, "Valid", backgroundColor: Colors.green)
                : showSnackBar(context, "Ada yg blum valid", backgroundColor: Colors.red),
            child: Icon(Icons.arrow_forward_rounded),
          ),
        ),
      ],
    ).insideScroll();
  }
}