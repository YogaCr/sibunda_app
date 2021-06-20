
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/ui.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';

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
              onTap: () => HomeRoutes.motherHplPage.goToPage(context),
            ),
            Spacer(flex: 3,),
            TxtBtn(
              Strings.no,
              isHollow: true,
              minWidth: 80,
              onTap: () => HomeRoutes.childrenCountPage.goToPage(context),
            ),
          ],
        ),
      ],
    );
  }
}