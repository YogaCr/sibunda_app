import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/form_warning_status.dart';
import 'package:common/arch/ui/adapter/form_warning_adp.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_items_chart.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/util/data_mapper.dart';
import 'package:common/util/navigations.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:kehamilanku/ui/chart/mother_chart_vm.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MotherChartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chartType = getArgs<MotherChartType>(context, Const.KEY_DATA);
    if(chartType == null) {
      throw "MotherChartPage needs `MotherChartType` argument with key '${Const.KEY_DATA}'";
    }
    final chartName = getMotherChartTypeString(chartType);
    final chartTitle = "Grafik $chartName";

    final vm = ViewModelProvider.of<MotherChartVm>(context)
      ..loadChart(chartType);

    return TopBarTitleAndBackFrame(
      withTopOffset: true,
      title: chartTitle,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,),
        child: BelowTopBarScrollContentArea(
          slivers:[SliverList(
            delegate: SliverChildListDelegate.fixed([
              LiveDataObserver<List<LineSeries<dynamic, num>>>(
                liveData: vm.seriesList,
                builder: (ctx, data) => data != null
                    ? ItemLineChart(
                        title: chartTitle,
                        yLabelFormat: getMotherChartTypeYLabelFormat(chartType),
                        xLabelFormat: Strings.pregnancy_chart_x_label_format,
                        xAxisTitle: Strings.week,
                        seriesList: data,
                    ): defaultLoading(),
              ),
              SizedBox(height: 10,),
              LiveDataObserver<List<FormWarningStatus>>(
                liveData: vm.warningList,
                builder: (ctx, data) => data != null
                    ? FormWarningList(data)
                    : defaultLoading(),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}