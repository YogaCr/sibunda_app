
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/page/secondary_frames.dart';
import 'package:common/ui/widget/custom_bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common/ui/widget/_intermediate_widget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
/*
    TopBarProfileFrame(
      name: ,
    );
 */
    return Expanded(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, bottom: 20, top: 40),
                        child: Text(
                          "Yuk Lihat Kesehatan Keluarga",
                          style: SibTextStyles.size_0_bold,
                        ),
                      ),
                      ///*
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
// */
                      Container(
                        margin: EdgeInsets.only(left: 20, bottom: 20, top: 40),
                        child: Text(
                          "Jelajahi Menu siBunda",
                          style: SibTextStyles.size_0_bold,
                        ),
                      ),
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
                      Container(
                        margin: EdgeInsets.only(left: 20, bottom: 20, top: 40,),
                        child: Text(
                          "Baca Tips dan Info untuk Bunda",
                          style: SibTextStyles.size_0_bold,
                        ),
                      ),
                      ///*
// */
                    ],
                  ),
                ]),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (c, i) => Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: ItemDashboardTips(
                        image: Container(color: Colors.red,),
                        headline: "Ini headline $i",
                        kind: "Hamil"
                    ),
                  ),
                  childCount: 10,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Lihat Selengkapnya",
                      style: SibTextStyles.size_min_2_colorPrimary,
                    ),
                  ),
                  SizedBox(height: 100,),
                ]),
              ),
            ],
          ),
/*
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [

            ],
          ),
        ),
 */
          Align(
            alignment: Alignment.bottomCenter,
            child: MiddleBtnBottomNavBar(
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
          ),
        ],
      ),
    );
  }
}