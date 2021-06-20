import 'package:common/config/_config.dart';
import 'package:common/ui/widget/_item_template.dart';
import 'package:flutter/material.dart';
import 'package:common/data/model/form_warning_status.dart';


class FormWarningList extends StatelessWidget {
  final List<FormWarningStatus> dataList;

  FormWarningList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (ctx, i) {
        final data = dataList[i];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: ItemFormWarningStatus(
            desc: data.desc,
            warningTxt: data.isSafe ? null : data.action,
            image: Container(
              color: Manifest.theme.colorPrimary, //TODO: img
            ),
          ),
        );
      },
    );
  }
}

class FormWarningSliverList extends StatelessWidget {
  final List<FormWarningStatus> dataList;

  FormWarningSliverList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (ctx, i) {
            final data = dataList[i];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ItemFormWarningStatus(
                desc: data.desc,
                warningTxt: data.isSafe ? null : data.action,
                image: Container(
                  color: Manifest.theme.colorPrimary, //TODO: img
                ),
              ),
            );
          },
        childCount: dataList.length,
      ),
    );
  }
}