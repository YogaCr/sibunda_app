import 'package:common/config/_config.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MotherHplPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          Strings.mother_children_data,
          style: SibTextStyles.header1,
        ), //TODO hardcode string
        Text("Sudah tahu kapan HPL Bunda?"),
        TxtInputUnderline(
          overText: "Masukkan hari perkiraan menurut dokter Bunda",
          onSuffixIconClick: () => showSnackBar(context, "Dipencet"),
        ),
        Text("Atau"),
        //Spacer(flex: 1,),
        Text("Yuk hitung HPL Bunda"),
        TxtInputUnderline(
          overText: "Masukkan HPHT Bunda",
          onSuffixIconClick: () => showSnackBar(context, "Dipencet 2"),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(SibDimensWidget.std_radius_circular),
            side: BorderSide(color: Manifest.theme.colorPrimary, width: 1.5),
          ),
          child: Column(
            children: [
              Text(
                "Hari perkiraan lahir bayi Bunda adalah:",
                style: SibTextStyles.size_min_1_grey,
              ),
              Text(
                "04 Desember 2021",
                style: SibTextStyles.size_0_colorPrimary,
              ),
            ],
          ).withMargin(EdgeInsets.all(SibDimens.std_padding)),
        ),
        TxtBtn(
          Strings.save,
          onTap: () => showSnackBar(context, "Dipencet"),
        ),
      ],
    );
  }
}