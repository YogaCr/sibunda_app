import 'package:common/arch/ui/model/home_graph_menu.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:flutter/cupertino.dart';

class HomeGraphMenuList extends StatelessWidget {
  final List<HomeGraphMenu> dataList;
  HomeGraphMenuList(this.dataList);

  @override
  Widget build(BuildContext context) {
    final itemList = <Widget>[]; //dataList.map((e) => ItemHomeGraphMenu.fromData(e)).toList(growable: false);
    for(final data in dataList) {
      itemList.add(
        Flexible(
          flex: 10,
          child: ItemHomeGraphMenu.fromData(data),
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