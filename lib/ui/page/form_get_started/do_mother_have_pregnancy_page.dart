import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:common/ui/widget/_intermediate_widget.dart';
import 'package:common/util/functions/assets_ext.dart';
import 'package:flutter/material.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:sibunda_app/config/routes.dart';

class DoMotherHavePregnancyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.mother_children_data,
          style: SibTextStyles.header1,
        ), //TODO hardcode string
        SibImages.get("ilstr_mother_pregnant.png", package: "common",)
            .withMargin(EdgeInsets.symmetric(horizontal: 50).copyWith(top: 70)),
        Text(
          "Apakah Bunda sedang hamil?",
          style: SibTextStyles.size_0_bold,
          textAlign: TextAlign.center,
        ),
        Row(
          children: [
            TxtBtn(
              Strings.yes,
              minWidth: 80,
              onTap: () => SibRoutes.motherHplPage.goToPage(context),
            ),
            Spacer(flex: 3,),
            TxtBtn(
              Strings.no,
              isHollow: true,
              minWidth: 80,
              onTap: () => SibRoutes.childrenCountPage.goToPage(context),
            ),
          ],
        ),
      ],
    );
  }
}