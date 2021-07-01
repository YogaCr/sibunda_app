import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ItemLineChart extends StatelessWidget {
  final String title;
  final List<LineSeries<dynamic, num>> seriesList;
  //final List<FormWarningStatus> warningList;

  ItemLineChart({
    required this.title,
    required this.seriesList,
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
        overflowMode: LegendItemOverflowMode.wrap,
      ),
      primaryXAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        interval: 2,
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        labelFormat: '{value}%',
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