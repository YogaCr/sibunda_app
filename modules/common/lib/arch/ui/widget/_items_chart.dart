import 'package:common/arch/domain/model/chart_data.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/domain/model/img_data.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ItemGraphMenu extends StatelessWidget {
  final ImgData img;
  final String title;
  final void Function()? onClick;

  ItemGraphMenu({
    required this.img,
    required this.title,
    this.onClick,
  });

  ItemGraphMenu.fromData(ChartMenuData data, {this.onClick}):
        title = data.title,
        img = data.img
  ;

  @override
  Widget build(BuildContext context) {
    final parentHeight = 80.0;

    final image = SibImages.resolve(img);

    final imgChild = Container(
        margin: EdgeInsets.only(right: 15),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: 90,
              child: image,
            ),
          ),
        )
    );

    final txtChild = Text(
      title,
      style: SibTextStyles.size_0_colorPrimary,
    );

    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      onTap: onClick,
      splashColor: Colors.grey,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: grey_calm,
        ),
        height: parentHeight,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              imgChild,
              Expanded(child: txtChild,),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemLineChart extends StatelessWidget {
  final String title;
  final List<LineSeries<dynamic, num>> seriesList;
  final String yLabelFormat;
  final String xLabelFormat;
  final String? xAxisTitle;
  //final List<FormWarningStatus> warningList;

  ItemLineChart({
    required this.title,
    required this.seriesList,
    this.yLabelFormat = "{value}",
    this.xLabelFormat = "{value}",
    this.xAxisTitle,
    //required this.warningList,
  });

  @override
  Widget build(BuildContext context) {
    final chart = SfCartesianChart(
      title: ChartTitle(
        text: title,
        textStyle: SibTextStyles.size_min_1_bold,
      ),
      series: seriesList,
      tooltipBehavior: TooltipBehavior(enable: true,),
      legend: Legend(
        backgroundColor: grey_calm,
        isVisible: true,
        position: LegendPosition.bottom,
        overflowMode: LegendItemOverflowMode.wrap,
      ),
      primaryXAxis: NumericAxis(
        title: xAxisTitle != null ? AxisTitle(
          text: xAxisTitle,
          textStyle: TextStyle(fontStyle: FontStyle.italic,),
        ) : null,
        labelFormat: xLabelFormat,
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        labelFormat: yLabelFormat, //'{value}%',
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(color: Colors.transparent),
      ),
    );

    final columnChildren = <Widget>[chart];
/*
    if(warningList.isNotEmpty) {
      for(final warning in warningList) {
        columnChildren.add(Container(
          margin: EdgeInsets.symmetric(vertical: 5,),
          child: ItemFormWarningStatus.fromData(warning),
        ));
      }
    }
 */
    return Column(
      children: columnChildren,
    );
  }
}