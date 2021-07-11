import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/times.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChildrenListOverlay extends StatelessWidget {
  final List<BabyOverlayData> bornBabyList;
  final List<BabyOverlayData> unbornBabyList;
  final void Function(BabyOverlayData, bool isBorn)? onItemClick;

  ChildrenListOverlay({
    required this.bornBabyList,
    required this.unbornBabyList,
    this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10,),
          ChildrenSingleListOverlay(
            header: Strings.my_pregnancy,
            dataList: unbornBabyList,
            datePrefix: "${Strings.hpl}: ",
            onItemClick: onItemClick != null
                ? (data) => onItemClick!.call(data, false)
                : null,
          ),
          SizedBox(height: 10,),
          ChildrenSingleListOverlay(
            header: Strings.my_baby,
            dataList: bornBabyList,
            datePrefix: "${Strings.born}: ",
            onItemClick:  onItemClick != null
                ? (data) => onItemClick!.call(data, true)
                : null,
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}

class ChildrenSingleListOverlay extends StatelessWidget {
  final String header;
  final String datePrefix;
  final List<BabyOverlayData> dataList;
  final void Function(BabyOverlayData)? onItemClick;

  ChildrenSingleListOverlay({
    required this.header,
    required this.dataList,
    this.datePrefix = "",
    this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    final headerWidget = Text(
      header,
      style: SibTextStyles.size_0_bold,
      textAlign: TextAlign.center,
    );

    final listWidget = dataList.isNotEmpty ? dataList.map<Widget>((e) => Container(
      decoration: BoxDecoration(
        color: grey_calm,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 5,),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onItemClick != null
              ? () => onItemClick!.call(e)
              : null,
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              child: ClipOval(
                child: SibImages.resolve(
                  e.img,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            title: Text(
              e.name,
              style: SibTextStyles.size_0_bold,
            ),
            subtitle: Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                _getDateStr(e.date),
                style: SibTextStyles.size_min_1_grey,
              ),
            ),
          ),
        ),
      ),
    )) : <Widget>[defaultNoData()];

    return Column(
      children: [
        headerWidget,
        SizedBox(height: 5,),
        ...listWidget,
      ],
    );
  }

  String _getDateStr(DateTime date) => datePrefix.isNotEmpty
      ? "$datePrefix${syncFormatTime(date)}"
      : syncFormatTime(date);
}