import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/ui/model/dummy_ui_data.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_item_immunization.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/arch/ui/widget/_items_kehamilanku.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/navigations.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:core/util/_consoles.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kehamilanku/config/kehamilanku_keys.dart';
import 'package:kehamilanku/config/kehamilanku_routes.dart';
import 'package:kehamilanku/ui/home/kehamilanku_home_vm.dart';




class KehamilankuHomePage extends StatelessWidget {
  final overlayVisibility = MutableLiveData(false);

  @override
  Widget build(BuildContext context) {
    prind("KehamilankuHomePage build()");
    final selectedPreg = getArgs<ProfileCredential>(context, Const.KEY_DATA);

    final vm = ViewModelProvider.of<KehamilankuHomeVm>(context)
      ..getBabyOverlay();
      //..init();
    prind("KehamilankuHomePage build() 2");

    vm..ageOverview.observe(vm, (data) {
      if(data != null) {
        overlayVisibility.value = false;
      }
    }, tag: toString());

    if(selectedPreg != null) {
      vm.init(profile: selectedPreg);
    }

    return TopBarTitleAndBackFrame(
      title: Strings.my_pregnancy,
      withTopOffset: true,
      topBarChild: BabyOverlayControlBtn(
        key: KehamilankuKeys.home_btnBabySelection,
        text: Strings.my_pregnancy,
        visibilityController: overlayVisibility,
      ),
      contentOverlay: BabySelectionOverlay(
        visibilityController: overlayVisibility,
        selectedIndex: vm.selectedIndex,
        bornBabyList: vm.bornBabyList,
        unbornBabyList: vm.unbornBabyList,
        onItemClick: (baby, isBorn) {
          if(!isBorn) { // unborn baby must always be 1. Off course though.
            final prof = ProfileCredential.fromBabyOverlay(baby);
            prind("PregHomePage prof= $prof vm.selectedProfile.value= ${vm.selectedProfile.value}");
            if(prof != vm.selectedProfile.value) {
              vm.init(profile: prof);
            }
            overlayVisibility.value = false;
          } else {
            KehamilankuRoutes.obj.goToModule(
              context, GlobalRoutes.bayiku,
              args: GlobalRoutes.makeBabyHomePageData(
                babyCredential: ProfileCredential.fromBabyOverlay(baby),
              ),
              replaceCurrent: true,
            );
          }
          //showSnackBar(context, "Nama= ${baby.name} isBorn= $isBorn");
        },
        onAddItemClick: (isBorn) async {
          prind("Kehamilanku baby overlay add isBorn= $isBorn");
          if(isBorn) {
            //final oldBabyCount = vm.bornBabyList.value?.length;
            final isSaved = await KehamilankuRoutes.obj.goToExternalRouteBuilder(
              context,
              GlobalRoutes.home_childFormPage,
              builderArgs: GlobalRoutes.makeHomeChildFormPageBuilderData(),
            );
            if(isSaved == true) {
              vm..bornBabyList.observeOnce((babyList) {
                if(babyList?.isNotEmpty == true) {
                  final babyCred = ProfileCredential.fromBabyOverlay(babyList!.last);
                  KehamilankuRoutes.obj.goToModule(
                    context, GlobalRoutes.bayiku,
                    replaceCurrent: true,
                    args: GlobalRoutes.makeBabyHomePageData(
                      babyCredential: babyCred,
                    ),
                  );
                }
              }, immediatelyGet: false)
                ..getBabyOverlay(forceLoad: true);
            }
          } else {
            final isSaved = await KehamilankuRoutes.obj.goToExternalRouteBuilder(
              context,
              GlobalRoutes.home_motherHplPage,
            );
            if(isSaved == true) {
              vm..unbornBabyList.observeOnce((babyList) {
                if(babyList?.isNotEmpty == true) {
                  final babyCred = ProfileCredential.fromBabyOverlay(babyList!.last);
                  //prind("PregHomePage add fetus babyCred= $babyCred vm.selectedProfile.value= ${vm.selectedProfile.value}");
                  vm.init(profile: babyCred);
                }
              }, immediatelyGet: false)
                ..getBabyOverlay(forceLoad: true);
            }
          }
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: LiveDataObserver<List<BabyOverlayData>>(
          liveData: vm.unbornBabyList,
          builder: (ctx, data) {
            if(data?.isNotEmpty == true) return _PregnancyHomePageWithData(vm: vm,);
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

    //final foodList = ["Nasi", "Sego", "Nasi atau Makanan Pokok", "Bubur sego"];
  }
}


class _PregnancyHomePageWithData extends StatelessWidget {
  final KehamilankuHomeVm vm;

  _PregnancyHomePageWithData({
    required this.vm,
  });

  @override
  Widget build(BuildContext context) {
    return BelowTopBarScrollContentArea(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            Container(
              margin: EdgeInsets.symmetric(vertical: 15).copyWith(top: 20),
              child: MultiLiveDataObserver<dynamic>(
                liveDataList: [vm.ageOverview, vm.isBorn],
                //
                builder: (ctx, dataList) {
                  final MotherPregnancyAgeOverview? ageOverview = dataList[0];
                  final bool? isBorn = dataList[1];

                  if(isBorn == true) {
                    return LiveDataObserver<BabyOverlayData>(
                      liveData: vm.selectedUnbornBabyOverlay,
                      builder: (ctx, data) => ItemMotherBornOverview(
                        bornBaby: data,
                        onActionClick: data != null ? () {
                          prind("PregnancyHomePage born action clicked");
                          KehamilankuRoutes.obj.goToModule(
                            ctx, GlobalRoutes.bayiku,
                            args: GlobalRoutes.makeBabyHomePageData(
                              babyCredential: ProfileCredential.fromBabyOverlay(data),
                            ),
                            replaceCurrent: true,
                          );
                        } : null,
                      ),
                    );
                  }
                  return ItemMotherUnbornOverview.fromData(data: ageOverview,);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                "Yuk pantau usia kehamilan Bunda",
                style: SibTextStyles.size_0_bold,
                textAlign: TextAlign.start,
              ),
            ),
          ]),
        ),
        MultiLiveDataObserver<dynamic>(
          liveDataList: [vm.trimesterList, vm.selectedProfile],
          builder: (ctx, dataList) => !dataList.any((e) => e == null)
              ? _MotherTrimesterList(
            dataList: dataList[0],
            selectedPregnancy: dataList[1],
          ): SliverToBoxAdapter(child: defaultLoading(),),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            Container(
              margin: EdgeInsets.only(top: 5),
              child: LiveDataObserver<ProfileCredential>(
                liveData: vm.selectedProfile,
                builder: (ctx, data) => ItemHomeImmunization.fromData(
                  motherHomeImmunization_ui,
                  btnKey: KehamilankuKeys.home_btnImmunization,
                  onBtnClick: data != null ? () => KehamilankuRoutes.immunizationPage.go(
                    context: context,
                    pregnancyCred: data,
                  ) : null,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Pantau perkembangan janin & kehamilan",
                style: SibTextStyles.size_0_bold,
                textAlign: TextAlign.start,
              ),
            ),
            LiveDataObserver<ProfileCredential>(
              liveData: vm.selectedProfile,
              builder: (ctx, data) {
                if(data == null) {
                  return defaultLoading();
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 10,
                      child: ItemHomeGraphMenu.fromData(
                        pregnancyHomeGraphMenu[0],
                        key: KehamilankuKeys.home_btnChartPregnancyEval,
                        onClick: () => KehamilankuRoutes.pregEvalChartMenuPage.go(
                          context: ctx,
                          pregnancyCred: data,
                        ),
                      ),
                    ),
                    Spacer(flex: 1,),
                    Flexible(
                      flex: 10,
                      child: ItemHomeGraphMenu.fromData(
                        pregnancyHomeGraphMenu[1],
                        key: KehamilankuKeys.home_btnChartWeight,
                        onClick: () => KehamilankuRoutes.chartPage.go(
                          context: ctx,
                          type: MotherChartType.bmi,
                          pregnancyCred: data,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Rekomendasi makanan untuk Bunda",
                style: SibTextStyles.size_0_bold,
                textAlign: TextAlign.start,
              ),
            ),
          ]),
        ),
        AsyncVmObserver<KehamilankuHomeVm, List<MotherFoodRecom>>(
          vm: vm,
          liveDataGetter: (vm2) => vm2.foodRecomList,
          builder: (ctx, data) => data != null
              ? _MotherFoodRecomList(data)
              : SliverToBoxAdapter(child: defaultLoading(),),
        ),
      ],
    );
  }
}



class _MotherTrimesterList extends StatelessWidget {
  final List<MotherTrimester> dataList;
  final ProfileCredential selectedPregnancy;

  _MotherTrimesterList({
    required this.dataList,
    required this.selectedPregnancy,
  });
  //_MotherTrimesterList.def(): dataList = dummyTrimesterList;

  @override
  Widget build(BuildContext context) => SliverList(
    delegate: SliverChildBuilderDelegate(
      (c, i) {
        final data = dataList[i];
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: ItemMotherTrimester.fromData(
            data,
            key: KehamilankuKeys.home_btnTrimester(i),
            onClick: () => KehamilankuRoutes.pregnancyCheckPage.go(
              context: c,
              data: data,
              pregnancyCred: selectedPregnancy,
              isLastTrimester: i == dataList.length -1,
            ),
          ),
        );
      },
      childCount: dataList.length,
    ),
  );
}

class _MotherFoodRecomList extends StatelessWidget {
  final List<MotherFoodRecom> dataList;

  _MotherFoodRecomList(this.dataList);
  //_MotherFoodRecomList.def(): dataList = dummyFoodRecomList(1);

  @override
  Widget build(BuildContext context) => SliverList(
    delegate: SliverChildBuilderDelegate(
        (c, i) {
          final data = dataList[i];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: ItemMotherRecomFood.fromData(data),
          );
        },
      childCount: dataList.length,
    ),
  );
}