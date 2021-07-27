
import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:flutter/material.dart';

class TipsSliverList extends StatelessWidget {
  final List<Tips> dataList;
  final void Function(Tips)? onItemClick;
  TipsSliverList(this.dataList, { this.onItemClick, });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (ctx, i) => InkWell(
          onTap: onItemClick != null
              ? () => onItemClick!(dataList[i]) : null,
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: ItemTips.fromData(dataList[i]),
          ),
        ),
        childCount: dataList.length,
      ),
    );
  }
}