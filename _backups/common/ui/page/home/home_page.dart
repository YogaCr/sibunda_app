
import 'package:common/data/dummy_data.dart';
import 'package:common/data/model/home_data.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/page/secondary_frames.dart';
import 'package:common/ui/widget/bloc/result_builder.dart';
import 'package:common/ui/widget/custom_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common/ui/widget/_intermediate_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibunda_app/bloc/event/home_event.dart';
import 'package:sibunda_app/bloc/home_bloc.dart';
import 'package:sibunda_app/bloc/state/home_state.dart';
import 'package:sibunda_app/config/routes.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    bloc.add(GetHomeStatusData());
    bloc.add(GetHomeMenuData());
    bloc.add(GetHomeTipsData());
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
      onActionBtnClick: (ctx) => SibRoutes.notifAndMessagePage.goToPage(context),
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
/*
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            //separatorBuilder: (BuildContext context, int index) => SizedBox(width: 20,),
                            itemCount: 5,
                            itemBuilder: (ctx, i) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: ItemDashboardStatus(
                                image: Container(color: Colors.blue,), content: "Halo pak $i",
                                bgColor: red_warning,
                              ),
                            ),
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
 */
            buildReactiveBlocBuilder<
                HomeBloc, HomeState, OnHomeStatusDataChanged, List<HomeStatus>
            >(
              stateDataGetter: (state) => state.data,
              blocDataGetter: (bloc) => bloc.statusList,
              builder: (data) => _StatusList(data),
            ),
// */
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 20, top: 40),
              child: Text(
                "Jelajahi Menu siBunda",
                style: SibTextStyles.size_0_bold,
              ),
            ),

            buildReactiveBlocBuilder<
                HomeBloc, HomeState, OnHomeMenuDataChanged, List<HomeMenu>
            >(
              stateDataGetter: (state) {
                print("OnHomeMenuDataChanged state= $state");
                return state.data;
              },
              blocDataGetter: (bloc) => bloc.menuList,
              builder: (data) => _MenuList(data),
            ),
/*
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ItemDashboardMenu(
                              image: Container(),
                              text: "Kehamilanku",
                            ),
                            ItemDashboardMenu(
                              image: Container(),
                              text: "Bayiku",
                            ),
                            ItemDashboardMenu(
                              image: Container(),
                              text: "Covid-19",
                            ),
                          ],
                        ),
 */
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 20, top: 40,),
              child: Text(
                "Baca Tips dan Info untuk Bunda",
                style: SibTextStyles.size_0_bold,
              ),
            ),

            buildReactiveBlocBuilder<
                HomeBloc, HomeState, OnHomeTipsDataChanged, List<HomeTips>
            >(
              stateDataGetter: (state) => state.data,
              blocDataGetter: (bloc) => bloc.tipsList,
              builder: (data) => _TipsList(data),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 15),
              child: Text(
                "Lihat Selengkapnya",
                style: SibTextStyles.size_min_2_colorPrimary,
              ),
            ),
            SizedBox(height: 100,),
            ///*
// */
          ]),
        ),
      ]),
      bottomBar: MiddleBtnBottomNavBar(
        midBtnChild: Icon(Icons.image,),
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
        children: List.generate(dataList.length, (index) => ItemDashboardMenu.fromData(
          dataList[index],
          onClick: () {
            print("onClick() clicked index= $index");
            SibRoutes.pregnancyHomePage.goToPage(context);
          },
        )),
      ),
    );
  }
}

class _TipsList extends StatelessWidget {
  final List<HomeTips> dataList;

  _TipsList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: List.generate(dataList.length, (index) => Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ItemDashboardTips.fromData(dataList[index]),
        ),
        ),
      ),
    );
  }
}