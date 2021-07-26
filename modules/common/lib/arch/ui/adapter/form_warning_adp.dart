import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/config/_config.dart';
import 'package:flutter/material.dart';

import '../widget/_item_template.dart';


class FormWarningList extends StatelessWidget {
  final List<FormWarningStatus> dataList;

  FormWarningList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: dataList.map((data) => Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: ItemFormWarningStatus.fromData(data),
      )).toList(growable: false),
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
              child: ItemFormWarningStatus.fromData(data),
            );
          },
        childCount: dataList.length,
      ),
    );
  }
}