import 'package:bayiku/config/baby_routes.dart';
import 'package:bayiku/ui/home/baby_home_vm.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/chart_data_baby.dart';
import 'package:common/arch/ui/model/dummy_ui_data.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_item_immunization.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/arch/ui/widget/_items_bayiku.dart';
import 'package:common/config/manifest.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';

class BabyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<BabyHomeVm>(context)
      ..getBabyAgeOverview(babyNik: "")
      ..getBabyFormMenuList();

    return TopBarTitleAndBackFrame(
      isScroll: true,
      title: Strings.my_baby,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: BelowTopBarScrollContentArea(
          slivers: [SliverList(
            delegate: SliverChildListDelegate.fixed([
              Container(
                margin: EdgeInsets.symmetric(vertical: 15).copyWith(top: 20),
                child: AsyncVmObserver<BabyHomeVm, BabyAgeOverview>(
                  vm: vm,
                  liveDataGetter: (vm2) => vm2.ageOverview,
                  builder: (ctx, data) => ItemBabyOverview.fromData(data),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 20,),
                child: Text(
                  "Pantau pertumbuhan dan perkembangan bayi",
                  style: SibTextStyles.size_0_bold,
                  textAlign: TextAlign.start,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 10,
                    child: ItemHomeGraphMenu(
                      image: Container(color: Manifest.theme.colorPrimary,),
                      text: "Pertumbuhan Bayi",
                      onClick: () => BabyRoutes.growthChartMenuVm.goToPage(context),
                    ),
                  ),
                  Spacer(flex: 1,),
                  Flexible(
                    flex: 10,
                    child: ItemHomeGraphMenu(
                      image: Container(color: Manifest.theme.colorPrimary,),
                      text: "Perkembangan Bayi",
                      onClick: () => BabyRoutes.chartPageRoute.go(context, BabyChartType.dev),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 20,),
                child: Text(
                  "Yuk pantau kesehatan Bayi Bunda",
                  style: SibTextStyles.size_0_bold,
                  textAlign: TextAlign.start,
                ),
              ),
              AsyncVmObserver<BabyHomeVm, List<BabyFormMenuData>>(
                vm: vm,
                liveDataGetter: (vm2) => vm2.formMenuList,
                builder: (ctx, data) => data != null
                    ? _BabyFormMenuList(data)
                    : defaultLoading(),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: ItemHomeImmunization.fromData(
                  babyHomeImmunization_ui,
                  onBtnClick: () => BabyRoutes.babyImmunizationPage.goToPage(context),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}


class _BabyFormMenuList extends StatelessWidget {
  final List<BabyFormMenuData> dataList;
  _BabyFormMenuList(this.dataList);

  @override
  Widget build(BuildContext context) {
    final children = List<Widget>.generate(dataList.length, (i) => Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: ItemBabyFormMenu.fromData(
        dataList[i],
        onClick: () => BabyRoutes.babyCheckPage.go(context, dataList[i]),
      ),
    ));

    return Column(
      children: children,
    );
  }
}