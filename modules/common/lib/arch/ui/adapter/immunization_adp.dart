import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/ui/model/immunization.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_item_immunization.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/config/keys.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:flutter/cupertino.dart';

class ImmunizationListView extends StatelessWidget {
  final List<UiImmunizationListItem> dataList;
  ImmunizationListView(this.dataList);

  ImmunizationListView.fromDomainModel(List<ImmunizationDetail> dataList):
    this.dataList = dataList.map((e) => UiImmunizationListItem.fromModelDetail(e)).toList(growable: false)
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
  final List<UiImmunizationListGroup> dataList;
  final void Function(int groupIndex, int childIndex)? onBtnClick;

  ImmunizationListGroupView(this.dataList, {
    this.onBtnClick,
  });

  @override
  Widget build(BuildContext context) {
    if(dataList.isEmpty) {
      return defaultNoData();
    }
    final colChildren = <Widget>[];
    int groupIndex = -1;
    for(final group in dataList) {
      final groupIndex2 = ++groupIndex;
      colChildren.add(
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 5,),
          child: Text(
            group.header,
            style: SibTextStyles.size_min_1_bold,
            textAlign: TextAlign.start,
          ),
        ),
      );
      int childIndex = -1;
      for(final immunization in group.immunizationList) {
        final childIndex2 = ++childIndex;
        colChildren.add(
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: ItemImmunizationFill.fromData(
              immunization,
              btnKey: CommonKeys.getBtnImmunizationItem(immunization.core.occurrenceId),
              onBtnClick: () => onBtnClick?.call(groupIndex2, childIndex2),
            ),
/*
            child: LiveDataObserver<bool>(
              liveData: MutableLiveData,
              builder: (ctx, data) => ItemImmunizationFill.fromData(immunization),
            ),
 */
          ),
        );
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: colChildren,
    );
  }
}