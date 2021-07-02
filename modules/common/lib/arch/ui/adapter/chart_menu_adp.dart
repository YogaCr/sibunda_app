import 'package:common/arch/domain/model/chart_data.dart';
import 'package:common/arch/ui/widget/_items_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartMenuList<T extends ChartMenuData> extends StatelessWidget {
  final List<T> dataList;
  final void Function(T)? onItemClick;
  ChartMenuList(this.dataList, { this.onItemClick });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: dataList.map((e) => InkWell(
        onTap: onItemClick != null
            ? () => onItemClick!(e)
            : null,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5,),
          child: ItemGraphMenu.fromData(e),
        ),
      )).toList(growable: false),
    );
  }
}