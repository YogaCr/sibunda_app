import 'package:common/arch/domain/model/covid_data.dart';
import 'package:common/arch/ui/adapter/home_graph_menu_adp.dart';
import 'package:common/arch/ui/model/home_graph_menu.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_items_covid.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:covid19/config/covid_routes.dart';
import 'package:covid19/ui/home/covid_home_vm.dart';
import 'package:flutter/cupertino.dart';

class CovidHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<CovidHomeVm>(context)
      ..getOverview()
      ..getMenu()
      ..getCheckHistory();

    return TopBarTitleAndBackFrame(
      withTopOffset: true,
      title: "Menu Cek Covid-19\nBunda dan Bayi", //Strings.covid_19,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: BelowTopBarScrollContentArea(slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              Container(
                margin: EdgeInsets.symmetric(vertical: 15).copyWith(top: 20),
                child: AsyncVmObserver<CovidHomeVm, CovidHomeOverview>(
                  vm: vm,
                  liveDataGetter: (vm2) => vm2.overview,
                  builder: (ctx, data) => data != null
                      ? ItemCovidHomeOverview.fromData(data)
                      : defaultLoading(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 20,),
                child: Text(
                  "Silahkan pilih Form nya ya Bun",
                  style: SibTextStyles.size_0_bold,
                  textAlign: TextAlign.start,
                ),
              ),
              AsyncVmObserver<CovidHomeVm, List<HomeGraphMenu>>(
                vm: vm,
                liveDataGetter: (vm2) => vm2.menuList,
                builder: (ctx, data) => data != null
                    ? HomeGraphMenuList(
                      data,
                      onItemClick: (i) async {
                        await CovidRoutes.covidCheckPage.go(context, isMother: i == 1); // i == 0 => baby, i == 1 => mother.
                        vm.getCheckHistory(forceLoad: true);
                      },
                    ) : defaultLoading(),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 20,),
                child: Text(
                  "Histori Cek Sebelumnya",
                  style: SibTextStyles.size_0_bold,
                  textAlign: TextAlign.start,
                ),
              ),
            ]),
          ),
          AsyncVmObserver<CovidHomeVm, List<CovidCheckHistory>>(
            vm: vm,
            liveDataGetter: (vm2) => vm2.historyList,
            builder: (ctx, data) => _CovidHomeCheckHistoryList(data ?? List.empty()),
          ),
        ]),
      ),
    );
  }
}


class _CovidHomeCheckHistoryList extends StatelessWidget {
  final List<CovidCheckHistory> dataList;
  _CovidHomeCheckHistoryList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: dataList.isNotEmpty ? SliverChildBuilderDelegate(
          (ctx, i) => Container(
            margin: EdgeInsets.symmetric(vertical: 5,),
            child: ItemCovidCheckHistory.fromData(dataList[i]),
          ),
        childCount: dataList.length,
      ) : SliverChildListDelegate.fixed([
        defaultNoData(),
      ]),
    );
  }
}