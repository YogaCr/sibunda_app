import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/ui/model/immunization.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:flutter/cupertino.dart';

class ImmunizationListView extends StatelessWidget {
  final List<ImmunizationListItem> dataList;
  ImmunizationListView(this.dataList);

  ImmunizationListView.fromDomainModel(List<ImmunizationDetail> dataList):
    this.dataList = dataList.map((e) => ImmunizationListItem.fromModelDetail(e)).toList(growable: false)
  ;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: (ctx, i) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ItemImmunizationFill.fromData(dataList[i]),
      ),
    );
  }
}


class ImmunizationListGroupView extends StatelessWidget {
  final List<ImmunizationListGroup> dataList;
  ImmunizationListGroupView(this.dataList);

  @override
  Widget build(BuildContext context) {
    final colChildren = <Widget>[];
    for(final group in dataList) {
      colChildren.add(
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 5,),
          child: Text(
            group.header,
            style: SibTextStyles.size_min_1_bold,
          ),
        ),
      );
      for(final immunization in group.immunizationList) {
        colChildren.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: ItemImmunizationFill.fromData(immunization),
          ),
        );
      }
    }
    return Column(
      children: colChildren,
    );
  }
}