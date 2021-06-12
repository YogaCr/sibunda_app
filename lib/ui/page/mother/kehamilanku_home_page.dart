import 'package:common/config/_config.dart';
import 'package:common/data/dummy_data.dart';
import 'package:common/data/model/kehamilanku_data.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:flutter/cupertino.dart';

import 'package:common/ui/widget/items_kehamilanku.dart';
import 'package:common/ui/widget/bloc/bloc_builder.dart';
import 'package:sibunda_app/bloc/kehamilanku_bloc.dart';
import 'package:sibunda_app/bloc/state/kehamilanku_home_state.dart';

class KehamilankuHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //final bloc = BlocProvider.of<PregnancyHomeBloc>(context);

    //final foodList = ["Nasi", "Sego", "Nasi atau Makanan Pokok", "Bubur sego"];
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15).copyWith(top: 20),
                  child: BlocPreAsyncBuilder<
                      PregnancyHomeBloc, PregnancyHomeState,
                      OnPregnancyHomeAgeOverviewDataChanged, MotherPregnancyAgeOverview
                  >(
                    stateDataGetter: (state) => state.data,
                    blocDataGetter: (bloc) => bloc.ageOverview,
                    builder: (data) => ItemMotherOverview.fromData(data),
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

/*
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: ItemMotherTrimester(
                    image: Container(color: Manifest.theme.colorPrimary,),
                    trimester: 1,
                    pregnancyAgeStart: 0,
                    pregnancyAgeEnd: 12,
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: ItemMotherTrimester(
                    image: Container(color: Manifest.theme.colorPrimary,),
                    trimester: 2,
                    pregnancyAgeStart: 13,
                    pregnancyAgeEnd: 24,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: ItemMotherTrimester(
                    image: Container(color: Manifest.theme.colorPrimary,),
                    trimester: 3,
                    pregnancyAgeStart: 25,
                    pregnancyAgeEnd: 40,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: ItemMotherImunization(
                    image: Container(color: Manifest.theme.colorPrimary,),
                  ),
                ),
// */
              ]),
            ),
/*
            BlocBuilder<PregnancyHomeBloc, PregnancyHomeState>(
              builder: (ctx, state) => (state is OnPregnancyHomeTrimesterDataChanged)
                  ? _MotherTrimesterList(state.data)
                  : (bloc.trimesterList != null)
                      ? _MotherTrimesterList(bloc.trimesterList!)
                      : Container(color: Manifest.theme.colorPrimary,),
            ),
 */
          BlocPreAsyncBuilder<
              PregnancyHomeBloc, PregnancyHomeState,
              OnPregnancyHomeTrimesterDataChanged, List<MotherTrimester>
          >(
            stateDataGetter: (state) => state.data,
            blocDataGetter: (bloc) => bloc.trimesterList,
            builder: (data) => _MotherTrimesterList(data),
          ),
            SliverList(
              delegate: SliverChildListDelegate.fixed([

                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "Pantau perkembangan janin & kehamilan",
                    style: SibTextStyles.size_0_bold,
                    textAlign: TextAlign.start,
                  ),
                ),

                ///*
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 10,
                      child: ItemMotherGraphMenu(
                        image: Container(color: Manifest.theme.colorPrimary,),
                        text: "Grafik Evaluasi Kehamilan",
                      ),
                    ),
                    Spacer(flex: 1,),
                    Flexible(
                      flex: 10,
                      child: ItemMotherGraphMenu(
                        image: Container(color: Manifest.theme.colorPrimary,),
                        text: "Grafik Berat Badan",
                      ),
                    ),
                  ],
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
              ]),
            ),
            BlocPreAsyncBuilder<
                PregnancyHomeBloc, PregnancyHomeState,
                OnPregnancyHomeFoodRecomDataChanged, List<MotherFoodRecom>
            >(
              stateDataGetter: (state) => state.data,
              blocDataGetter: (bloc) => bloc.foodRecomList,
              builder: (data) => _MotherFoodRecomList(data),
            ),
/*
            BlocBuilder<PregnancyHomeBloc, PregnancyHomeState>(
              builder: (ctx, state) => _MotherFoodRecomList(
                  (state is OnPregnancyHomeFoodRecomDataChanged)
                      ? state.data : bloc.foodRecomList
              ),
            ),
// */
          ],
        ),
      ),
    );
  }
}


class _MotherTrimesterList extends StatelessWidget {
  final List<MotherTrimester> dataList;

  _MotherTrimesterList(this.dataList);
  _MotherTrimesterList.def(): dataList = dummyTrimesterList;

  @override
  Widget build(BuildContext context) => SliverList(
    delegate: SliverChildBuilderDelegate(
        (c, i) {
          final data = dataList[i];
          return ItemMotherTrimester(
            image: Container(color: Manifest.theme.colorPrimary,),
            trimester: data.trimester,
            pregnancyAgeStart: data.startWeek,
            pregnancyAgeEnd: data.endWeek,
          );
        },
      childCount: dataList.length,
    ),
  );
}

class _MotherFoodRecomList extends StatelessWidget {
  final List<MotherFoodRecom> dataList;

  _MotherFoodRecomList(this.dataList);
  _MotherFoodRecomList.def(): dataList = dummyFoodRecomList(1);

  @override
  Widget build(BuildContext context) => SliverList(
    delegate: SliverChildBuilderDelegate(
        (c, i) {
          final data = dataList[i];
          return ItemMotherRecomFood(
            image: Container(color: Manifest.theme.colorPrimary,),
            foodName: data.food,
            desc: data.desc,
          );
        },
      childCount: dataList.length,
    ),
  );
}