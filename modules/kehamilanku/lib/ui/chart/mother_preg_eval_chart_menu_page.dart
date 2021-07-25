import 'package:common/arch/domain/model/chart_data.dart';
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/ui/adapter/chart_menu_adp.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:kehamilanku/config/kehamilanku_routes.dart';
import 'package:kehamilanku/ui/chart/mother_preg_eval_chart_menu_vm.dart';

class MotherPregEvalChartMenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<MotherPregEvalChartMenuVm>(context)
      ..getMenuList();

    return TopBarTitleAndBackFrame(
      withTopOffset: true,
      title: "Grafik Evaluasi Kehamilan",
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,),
        child: BelowTopBarScrollContentArea(
          slivers:[SliverList(
            delegate: SliverChildListDelegate.fixed([
              Text(
                "Silahkan pilih grafiknya dulu ya Bun",
                style: SibTextStyles.size_min_1_bold,
              ),
              SizedBox(height: 10,),
              LiveDataObserver<List<MotherChartMenuData>>(
                liveData: vm.menuList,
                builder: (ctx, data) => data != null
                    ? ChartMenuList<MotherChartMenuData>(
                      data,
                      onItemClick: (it) => KehamilankuRoutes.chartPage.go(
                        context: context,
                        type: it.type,
                        pregnancyCred: vm.pregnancyId,
                      ),
                    ): defaultLoading(),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}