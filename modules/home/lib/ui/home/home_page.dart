
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/domain/model/home_data.dart';
import 'package:common/arch/ui/adapter/education_adp.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/arch/ui/widget/_items_home.dart';
import 'package:common/arch/ui/widget/custom_bottom_nav_bar.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/home/home_vm.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ViewModelProvider.of<HomeVm>(context)
    ..getStatusList()
    ..getMenuList()
    ..getTipsList();

/*
    TopBarProfileFrame(
      name: ,
    );
 */
    return TopBarProfileFrame.fromData(
      isScroll: true,
      data: dummyProfile,
      bgColor: grey_calmer,
      actionBtn: Icon(
        Icons.notifications_none_rounded,
        color: Colors.white,
      ),
      onActionBtnClick: (ctx) => HomeRoutes.homeNotifAndMessagePage.goToPage(context),
      body: BelowTopBarScrollContentArea([
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 20, top: 30),
              child: Text(
                "Yuk Lihat Kesehatan Keluarga",
                style: SibTextStyles.size_0_bold,
              ),
            ),

            AsyncVmObserver<HomeVm, List<HomeStatus>>(
              liveDataGetter: (vm2) => vm2.homeStatusList,
              builder: (ctx, data) => _StatusList(data ?? List.empty()),
            ),
/*
            buildReactiveBlocBuilder<
                HomeBloc, HomeState, OnHomeStatusDataChanged, List<HomeStatus>
            >(
              stateDataGetter: (state) => state.data,
              blocDataGetter: (bloc) => bloc.statusList,
              builder: (data) => _StatusList(data),
            ),
*/
// */
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 20, top: 40),
              child: Text(
                "Jelajahi Menu siBunda",
                style: SibTextStyles.size_0_bold,
              ),
            ),

            AsyncVmObserver<HomeVm, List<HomeMenu>>(
              liveDataGetter: (vm2) => vm2.homeMenuList,
              builder: (ctx, data) => _MenuList(data ?? List.empty()),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 20, top: 40,),
              child: Text(
                "Baca Tips dan Info untuk Bunda",
                style: SibTextStyles.size_0_bold,
              ),
            ),
          ]),
        ),
        AsyncVmObserver<HomeVm, List<Tips>>(
          liveDataGetter: (vm2) => vm2.homeTipsList,
          builder: (ctx, data) => TipsList(
            data ?? List.empty(),
            onItemClick: (data) => HomeRoutes.obj.goToExternalRoute(
              context, GlobalRoutes.education_detailPage,
              args: GlobalRoutes.makeEducationDetailPageData(data),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            InkWell(
              onTap: () => HomeRoutes.obj.goToModule(context, GlobalRoutes.education),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 15),
                child: Text(
                  "Lihat Selengkapnya",
                  style: SibTextStyles.size_min_2_colorPrimary,
                ),
              ),
            ),
            SizedBox(height: 100,),
          ]),
        ),
      ]),
      bottomBar: MiddleBtnBottomNavBar(
        midBtnOnClick: () => HomeRoutes.obj.goToModule(context, GlobalRoutes.education),
        midBtnChild: Padding(
          padding: EdgeInsets.all(3),
          child: Column(
            children: [
              Expanded(
                child: SibImages.get("ic_home_mid_btn.png", package: GlobalRoutes.common,),
              ),
              Text(
                "Info",
                style: SibTextStyles.size_min_1.copyWith(
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        items: [
          BottomNavigationBarItem(
            label: "Beranda",
            icon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            label: "Profil",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}



class _StatusList extends StatelessWidget {
  final List<HomeStatus> dataList;

  _StatusList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataList.length,
        itemBuilder: (ctx, i) => Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ItemDashboardStatus.fromData(dataList[i]),
        ),
      ),
    );
  }
}

class _MenuList extends StatelessWidget {
  final List<HomeMenu> dataList;

  _MenuList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(dataList.length, (index) {
          final data = dataList[index];
          return ItemDashboardMenu.fromData(
            data,
            onClick: () => HomeRoutes.obj.goToModule(context, data.moduleName),
          );
        }
      ),),
    );
  }
}


/*
class _TipsList extends StatelessWidget {
  final List<Tips> dataList;

  _TipsList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: List.generate(dataList.length, (index) => InkWell(
          onTap: () => HomeRoutes.obj.goToExternalRoute(
            context, GlobalRoutes.education_detailPage,
            args: GlobalRoutes.makeEducationDetailPageData(dataList[index]),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ItemTips.fromData(dataList[index]),
          ),
        ),
        ),
      ),
    );
  }
}
 */