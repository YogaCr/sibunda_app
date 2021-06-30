import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:common/ui/widget/_intermediate_widget.dart';
import 'package:common/util/functions/assets_ext.dart';
import 'package:flutter/material.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:sibunda_app/config/routes.dart';

class ChildrenCountPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          Strings.mother_children_data,
          style: SibTextStyles.header1,
        ), //TODO hardcode string
        SibImages.get("ilstr_mother_carry_baby.png", package: "common",) //TODO
            .withMargin(EdgeInsets.symmetric(horizontal: 50).copyWith(top: 70)),
        Text("Berapa anak yang Bunda punya?",),
        NumberPicker(
          onNumberChange: (i) => showSnackBar(context, "Dipencet i = $i"),
          max: 11,
        ),
        TxtInputUnderline(
          overText: "Tanggal lahir anak terakhir",
          onSuffixIconClick: () => showSnackBar(context, "Dipencet"),
        ),
        FloatingActionButton(
          child: Icon(Icons.arrow_forward_rounded),
          onPressed: () => SibRoutes.homePage.goToPage(context),
        ),
      ],
    );
  }
}