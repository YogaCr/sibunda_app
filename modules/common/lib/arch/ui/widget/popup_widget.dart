import 'package:common/arch/domain/model/_model_template.dart';
import 'package:common/arch/ui/adapter/id_string_adp.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupSuccess extends StatelessWidget {
  final String msg;
  final String actionMsg;
  final void Function()? onActionClick;

  PopupSuccess({
    required this.msg,
    required this.actionMsg,
    this.onActionClick,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width * 85 / 100;
    final height = screenSize.height * 40 / 100;
    final iconSize = screenSize.width * 30 / 100;

    return SingleChildScrollView(
      child: Container(
        width: width,
        height: height,
        //constraints: BoxConstraints(minHeight: 400, minWidth: 200,),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: green_calm,
              ),
              child: Icon(
                Icons.check,
                size: iconSize,
                color: Colors.white,
              ),
            ),
            Text(
              msg,
              style: SibTextStyles.size_0,
              textAlign: TextAlign.center,
            ),
            TxtBtn(
              actionMsg,
              onTap: onActionClick,
            ),
          ],
        ),
      ),
    );
  }
}


class IdStringPopup extends StatelessWidget {
  final List<IdStringModel> dataList;
  final void Function(int id, String name)? onItemClick;

  IdStringPopup({
    required this.dataList,
    this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    final txtControl = TextEditingController();
    return Column(
      children: [
        TxtInput(
          label: Strings.search,
          textController: txtControl,
        ),
        SizedBox(height: 15,),
        Expanded(
          child: IdStringListView(
            dataList: dataList,
            searchTxtControl: txtControl,
            onItemClick: onItemClick,
          ),
        ),
      ],
    );
  }
}
