import 'package:common/arch/di/config_di.dart';
import 'package:common/arch/domain/dummy_data.dart';
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
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
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

    if(selectedPreg != null) {
      vm.init(profile: selectedPreg);
    }

    return TopBarTitleAndBackFrame(
      title: Strings.my_pregnancy,
      withTopOffset: true,
      topBarChild: BabyOverlayControlBtn(
        text: Strings.my_pregnancy,
        visibilityController: overlayVisibility,
      ),
      contentOverlay: BabySelectionOverlay(
        visibilityController: overlayVisibility,
        selectedIndex: LiveData(0),
        bornBabyList: vm.bornBabyList,
        unbornBabyList: vm.unbornBabyList,
        onItemClick: (baby, isBorn) {
          if(!isBorn) { // unborn baby must always be 1. Off course though.
            overlayVisibility.value = false;
          } else {
            KehamilankuRoutes.obj.goToModule(
              context, GlobalRoutes.bayiku,
              args: { Const.KEY_DATA: ProfileCredential.fromBabyOverlay(baby) },
              replaceCurrent: true,
            );
          }
          //showSnackBar(context, "Nama= ${baby.name} isBorn= $isBorn");
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: BelowTopBarScrollContentArea(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15).copyWith(top: 20),
                  child: AsyncVmObserver<KehamilankuHomeVm, MotherPregnancyAgeOverview>(
                    vm: vm,
                    liveDataGetter: (vm2) => vm2.ageOverview,
                    builder: (ctx, data) => ItemMotherOverview.fromData(data),
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
            /*
            AsyncVmObserver<KehamilankuHomeVm, List<MotherTrimester>>(
              vm: vm,
              liveDataGetter: (vm2) => vm2.trimesterList,
              builder: (ctx, data) => data != null
                  ,
            ),
             */
            /*
              buildReactiveBloc<
                  PregnancyHomeBloc, PregnancyHomeState,
                  OnPregnancyHomeTrimesterDataChanged, List<MotherTrimester>
              >(
                context, state,
                stateDataGetter: (state) => state.data,
                blocDataGetter: (bloc) => bloc.trimesterList,
                builder: (data) => _MotherTrimesterList(data),
                defaultWidget: defaultSliverLoading,
              ),
// */
/*
                (state is OnPregnancyHomeTrimesterDataChanged)
                    ? _MotherTrimesterList((state.data as Success).data)
                    : (bloc.trimesterList != null)
                    ? _MotherTrimesterList(bloc.trimesterList!)
                    : SliverToBoxAdapter(child: DefaultLoading(),),
// */

            SliverList(
              delegate: SliverChildListDelegate.fixed([
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: LiveDataObserver<ProfileCredential>(
                    liveData: vm.selectedProfile,
                    builder: (ctx, data) => ItemHomeImmunization.fromData(
                      motherHomeImmunization_ui,
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

                ///*
                LiveDataObserver<ProfileCredential>(
                  liveData: vm.selectedProfile,
                  builder: (ctx, data) => data != null ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 10,
                        child: ItemHomeGraphMenu.fromData(
                          pregnancyHomeGraphMenu[0],
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
                          onClick: () => KehamilankuRoutes.chartPage.go(
                            context: ctx,
                            type: MotherChartType.bmi,
                            pregnancyCred: data,
                          ),
                        ),
                      ),
                    ],
                  ) : defaultLoading(),
                ),
// */
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Rekomendasi makanan untuk Bunda",
                    style: SibTextStyles.size_0_bold,
                    textAlign: TextAlign.start,
                  ),
                ),
/*
                  BlocPreAsyncBuilder<
                      PregnancyHomeBloc, PregnancyHomeState,
                      OnPregnancyHomeFoodRecomDataChanged, List<MotherFoodRecom>
                  >(
                    stateDataGetter: (state) => state.data,
                    blocDataGetter: (bloc) => bloc.foodRecomList,
                    builder: (data) => _MotherFoodRecomList(data),
                  ),
 */
              ]),
            ),
            AsyncVmObserver<KehamilankuHomeVm, List<MotherFoodRecom>>(
              vm: vm,
              liveDataGetter: (vm2) => vm2.foodRecomList,
              builder: (ctx, data) => data != null
                  ? _MotherFoodRecomList(data)
                  : SliverToBoxAdapter(child: defaultLoading(),),
            ),
            /*
              buildReactiveBloc<
                  PregnancyHomeBloc, PregnancyHomeState,
                  OnPregnancyHomeFoodRecomDataChanged, List<MotherFoodRecom>
              >(
                context, state,
                stateDataGetter: (state) => state.data,
                blocDataGetter: (bloc) => bloc.foodRecomList,
                builder: (data) => _MotherFoodRecomList(data),
                defaultWidget: defaultSliverLoading,
              ),
// */
/*
                (state is OnPregnancyHomeFoodRecomDataChanged)
                    ? _MotherFoodRecomList((state.data as Success).data)
                    : (bloc.foodRecomList != null)
                    ? _MotherFoodRecomList(bloc.foodRecomList!)
                    : SliverToBoxAdapter(child: DefaultLoading(),),
// */
          ],
        ),
      ),
    );

    //final foodList = ["Nasi", "Sego", "Nasi atau Makanan Pokok", "Bubur sego"];
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
            onClick: () => KehamilankuRoutes.pregnancyCheckPage.go(
              context: c,
              data: data,
              pregnancyCred: selectedPregnancy,
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