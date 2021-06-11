import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:flutter/cupertino.dart';

import 'package:common/ui/widget/items_kehamilanku.dart';

class KehamilankuHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final foodList = ["Nasi", "Sego", "Nasi atau Makanan Pokok", "Bubur sego"];
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed([
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15).copyWith(top: 20),
                  child: ItemMotherOverview(
                    image: Container(color: Manifest.theme.colorPrimary,),
                    pregnancyAge: 2,
                    pregnancyAgeRem: 256,
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

///*
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
///*
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (c, i) => Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0),
                    child: ItemMotherRecomFood(
                      image: Container(color: Manifest.theme.colorPrimary,),
                      foodName: foodList[i],
                      desc: "Bunda, 1 hari minimal harus makan 5 porsi nasi ya, dengan 1 porsi = 100 gr atau 3/4 gelas nasi ke $i"
                    ),
                  ),
                childCount: foodList.length,
              ),
            ),
// */
          ],
        ),
      ),
    );
  }
}