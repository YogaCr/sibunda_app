
import 'package:common/config/_config.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:common/util/functions/assets_ext.dart';
import 'package:flutter/material.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:common/util/functions/txt_ext.dart';

class CreateMyAccountPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.confirm_new_account,
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 60)),
        SibImages.get(""), //TODO pict dir,
        TxtBtn(
          Strings.create_my_account,
          color: green_calm,
        ),
      ],
    );
  }
}