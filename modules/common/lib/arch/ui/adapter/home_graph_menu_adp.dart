import 'package:common/arch/ui/model/home_graph_menu.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:flutter/cupertino.dart';

class HomeGraphMenuList extends StatelessWidget {
  final List<HomeGraphMenu> dataList;
  final void Function(int)? onItemClick;
  HomeGraphMenuList(this.dataList, {this.onItemClick});

  @override
  Widget build(BuildContext context) {
    final itemList = <Widget>[]; //dataList.map((e) => ItemHomeGraphMenu.fromData(e)).toList(growable: false);
    for(int i = 0; i < dataList.length; i++) {
      final i2 = i;
      final data = dataList[i2];
      itemList.add(
        Flexible(
          flex: 10,
          child: ItemHomeGraphMenu.fromData(
            data,
            onClick: onItemClick != null ? () => onItemClick!(i2) : null,
          ),
        ),
      );
      itemList.add(
        Spacer(flex: 1,),
      );
    }
    itemList.removeLast();
    return Row(
      children: itemList,
    );
  }
}