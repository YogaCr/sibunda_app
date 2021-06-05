
import 'package:common/res/theme/_theme.dart';
import 'package:flutter/material.dart';
import 'package:common/ui/widget/_intermediate_widget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Yuk Lihat Kesehatan Keluarga"),
        Expanded(
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              //itemCount: 3,
              itemBuilder: (ctx, i) => ItemDashboardStatus(
                image: Container(color: Colors.blue,), content: "Halo pak $i",
                bgColor: red_warning,
              ),
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),

        Text("Jelajahi Menu siBunda"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ItemDashboardMenu(
              image: Container(),
              text: "Bayiku",
            ),
            ItemDashboardMenu(
              image: Container(),
              text: "Ibuku",
            ),
          ],
        ),
        Text("Baca Tips dan Info untuk Bunda"),
      ],
    );
  }
}