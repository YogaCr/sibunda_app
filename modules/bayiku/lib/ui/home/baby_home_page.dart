import 'package:bayiku/config/baby_keys.dart';
import 'package:bayiku/config/baby_routes.dart';
import 'package:bayiku/ui/home/baby_home_vm.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/chart_data_baby.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/ui/model/dummy_ui_data.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_item_immunization.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/arch/ui/widget/_items_bayiku.dart';
import 'package:common/arch/ui/widget/_items_kehamilanku.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/navigations.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';

class BabyHomePage extends StatelessWidget {
  final overlayVisibility = MutableLiveData(false);

  @override
  Widget build(BuildContext context) {
    final selectedBaby = getArgs<ProfileCredential>(context, Const.KEY_DATA);

    final vm = ViewModelProvider.of<BabyHomeVm>(context)
      ..getBabyOverlay();

    vm.ageOverview.observe(vm, (data) {
      if(data != null) {
        overlayVisibility.value = false;
      }
    }, tag: toString());

    if(selectedBaby != null) {
      vm.initHome(babyCredential: selectedBaby);
    } else {
      final loadLast = getArgs<bool>(context, Const.KEY_LOAD_LAST);
      if(loadLast == true) {
        vm.bornBabyList.observeOnce((list) {
          if(list?.isNotEmpty == true) {
            final cred = ProfileCredential.fromBabyOverlay(list!.last);
            vm.initHome(babyCredential: cred);
          }
        }, immediatelyGet: true);
      }
    }

    return TopBarTitleAndBackFrame(
      withTopOffset: true,
      title: Strings.my_baby,
      topBarChild: BabyOverlayControlBtn(
        key: BabyKeys.home_btnBabySelection,
        text: Strings.my_baby,
        visibilityController: overlayVisibility,
      ),
      contentOverlay: BabySelectionOverlay(
        visibilityController: overlayVisibility,
        selectedIndex: vm.selectedIndex,
        bornBabyList: vm.bornBabyList,
        unbornBabyList: vm.unbornBabyList,
        onItemClick: (baby, isBorn) {
          if(!isBorn) { // unborn baby must always be 1. Off course though.
            BabyRoutes.obj.goToModule(
              context,
              GlobalRoutes.kehamilanku,
              replaceCurrent: true,
              args: {Const.KEY_DATA: ProfileCredential.fromBabyOverlay(baby)},
            );
          } else {
            final cred = ProfileCredential.fromBabyOverlay(baby);
            if(cred != vm.babyCredential.value) {
              vm.initHome(babyCredential: cred);
            } else {
              overlayVisibility.value = false;
            }
          }
        },
        onAddItemClick: (isBorn) async {
          if(isBorn) {
            final isSaved = await BabyRoutes.obj.goToExternalRouteBuilder(
              context,
              GlobalRoutes.home_childFormPage,
              builderArgs: GlobalRoutes.makeHomeChildFormPageBuilderData(),
            );
            prind("Baby add isSaved= $isSaved");
            if(isSaved == true) {
              vm..bornBabyList.observeOnce((babyList) {
                if(babyList?.isNotEmpty == true) {
                  final babyCred = ProfileCredential.fromBabyOverlay(babyList!.last);
                  //prind("Baby add last babyCred= $babyCred");
                  vm.initHome(babyCredential: babyCred);
                }
              }, immediatelyGet: false)
              ..getBabyOverlay(forceLoad: true);
            }
          } else {
            final isSaved = await BabyRoutes.obj.goToExternalRouteBuilder(
              context,
              GlobalRoutes.home_motherHplPage,
            );
            if(isSaved == true) {
              vm..unbornBabyList.observeOnce((babyList) {
                if(babyList?.isNotEmpty == true) {
                  final babyCred = ProfileCredential.fromBabyOverlay(babyList!.last);
                  BabyRoutes.obj.goToModule(
                    context, GlobalRoutes.kehamilanku,
                    replaceCurrent: true,
                    args: {Const.KEY_DATA: babyCred},
                  );
                }
              }, immediatelyGet: false)
                ..getBabyOverlay(forceLoad: true);
            }
          }
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: LiveDataObserver<List<BabyOverlayData>>(
          liveData: vm.bornBabyList,
          builder: (ctx, data) {
            if(data?.isNotEmpty == true) return _BabyHomePageWithData(vm: vm,);
            return BelowTopBarScrollContentArea(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate.fixed([
                    data == null ? defaultLoading() : defaultNoData(),
                  ]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


class _BabyHomePageWithData extends StatelessWidget {
  final BabyHomeVm vm;

  _BabyHomePageWithData({
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    return BelowTopBarScrollContentArea(
        slivers: [SliverList(
          delegate: SliverChildListDelegate.fixed([
            Container(
              margin: EdgeInsets.symmetric(vertical: 15).copyWith(top: 20),
              child: AsyncVmObserver<BabyHomeVm, BabyAgeOverview>(
                vm: vm,
                liveDataGetter: (vm2) => vm2.ageOverview,
                builder: (ctx, data) => ItemBabyOverview.fromData(data, babyName: vm.selectedBabyData?.name,),
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
                  child: AsyncVmObserver<BabyHomeVm, ProfileCredential>(
                    liveDataGetter: (vm) => vm.babyCredential,
                    builder: (ctx, data) => ItemHomeGraphMenu.fromData(
                      babyHomeGraphMenu[0],
                      onClick: data != null ? () => BabyRoutes.growthChartMenuVm.go(
                        context: context,
                        babyCredential: data,
                      ) : null,
                    ),
                  ),
                ),
                Spacer(flex: 1,),
                Flexible(
                  flex: 10,
                  child: AsyncVmObserver<BabyHomeVm, ProfileCredential>(
                    vm: vm,
                    liveDataGetter: (vm) => vm.babyCredential,
                    builder: (ctx, data) => ItemHomeGraphMenu.fromData(
                      babyHomeGraphMenu[1],
                      onClick: data != null ? () => BabyRoutes.chartPageRoute.go(
                        context: context,
                        type: BabyChartType.dev,
                        babyCredential: data,
                      ) : null,
                    ),
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
                  ? _BabyFormMenuList(
                vm: vm,
                dataList: data,
              ) : defaultLoading(),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: AsyncVmObserver<BabyHomeVm, ProfileCredential>(
                vm: vm,
                liveDataGetter: (vm) => vm.babyCredential,
                builder: (ctx, data) => ItemHomeImmunization.fromData(
                  babyHomeImmunization_ui,
                  onBtnClick: data != null ? () => BabyRoutes.babyImmunizationPage.go(
                    context: context,
                    babyCredential: data,
                  ) : null,
                ),
              ),
            ),
          ]),
        ),
        ]);
  }
}



class _BabyFormMenuList extends StatelessWidget {
  final List<BabyFormMenuData> dataList;
  final BabyHomeVm vm;

  _BabyFormMenuList({
    required this.dataList,
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    final children = List<Widget>.generate(dataList.length, (i) => Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: AsyncVmObserver<BabyHomeVm, ProfileCredential>(
        vm: vm,
        liveDataGetter: (vm) => vm.babyCredential,
        builder: (ctx, data) => ItemBabyFormMenu.fromData(
          dataList[i],
          onClick: data != null ? () => BabyRoutes.babyCheckPage.go(
            context: context,
            formData: dataList[i],
            babyCredential: data,
          ) : null,
        ),
      )
    ));

    return Column(
      children: children,
    );
  }
}