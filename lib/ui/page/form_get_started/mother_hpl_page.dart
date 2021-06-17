import 'package:common/config/_config.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sibunda_app/config/routes.dart';

class MotherHplPage extends StatelessWidget {
  final TextEditingController hplTxtController = TextEditingController();
  final TextEditingController hphtTxtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    DateTime? hplDate;
    DateTime? hphtDate;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          Strings.mother_children_data,
          style: SibTextStyles.header1,
        ), //TODO hardcode string
        Text("Sudah tahu kapan HPL Bunda?"),
        TxtInputUnderline(
          textController: hphtTxtController,
          overText: "Masukkan hari perkiraan menurut dokter Bunda",
          onSuffixIconClick: () async {
            hphtDate = await showDatePicker(
              context: context,
              initialDate: hphtDate ?? now,
              firstDate: DateTime(now.year -1),
              lastDate: DateTime(now.year +1),
            );
            hphtTxtController.text = hphtDate?.toString() ?? "";
          },
        ),
        Text("Atau"),
        //Spacer(flex: 1,),
        Text("Yuk hitung HPL Bunda"),
        TxtInputUnderline(
          textController: hplTxtController,
          overText: "Masukkan HPHT Bunda",
          onSuffixIconClick: () async {
            hplDate = await showDatePicker(
              context: context,
              initialDate: hplDate ?? now,
              firstDate: DateTime(now.year -1),
              lastDate: DateTime(now.year +1),
            );
            hplTxtController.text = hplDate?.toString() ?? "";
            if(hplDate != null) {
              hplTxtController.text = "";
              hphtDate = null;
            }
          },
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
          onTap: () => SibRoutes.childrenCountPage.goToPage(context),
        ),
      ],
    );
  }
}