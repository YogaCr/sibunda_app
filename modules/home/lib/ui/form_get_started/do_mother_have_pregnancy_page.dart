
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/form_get_started/do_mother_have_pregnancy_vm.dart';

class DoMotherHavePregnancyPage extends StatelessWidget {
  final PageController? pageControll;
  DoMotherHavePregnancyPage({ this.pageControll });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final picHeight = screenSize.height *40 /100;

    final vm = ViewModelProvider.of<DoMotherHavePregnancyVm>(context);

    return Column(
      children: [
        Text(
          Strings.mother_children_data,
          style: SibTextStyles.header1,
        ).withMargin(EdgeInsets.only(top: 10)),
        Container(
          height: picHeight,
          child: SibImages.get("ilstr_mother_pregnant.png", package: "common",)
              .withMargin(EdgeInsets.symmetric(horizontal: 50).copyWith(top: 70)),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Text(
            "Apakah Bunda sedang hamil?",
            style: SibTextStyles.size_0_bold,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: AsyncVmObserver<DoMotherHavePregnancyVm, bool>(
            vm: vm,
            liveDataGetter: (vm) => vm.onDelete
              ..observeForever((success) {
                if(success == true) {
                  if(pageControll != null) {
                    pageControll!.animateToPage(
                      pageControll!.page!.toInt() +2,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    );
                  } else {
                    HomeRoutes.childrenCountPage.goToPage(context);
                  }
                }
              }),
            builder: (ctx, onDelete) => Row(
              children: [
                Spacer(flex: 3,),
                TxtBtn(
                  Strings.yes,
                  minWidth: 80,
                  onTap: () {
                    if(pageControll != null) {
                      pageControll!.animateToPage(
                        pageControll!.page!.toInt() +1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeOut,
                      );
                    } else {
                      HomeRoutes.motherHplPage.go(context: context);
                    }
                    vm.isHplDeleted = false;
                  },
                ),
                Spacer(flex: 3,),
                TxtBtn(
                  Strings.no,
                  isHollow: true,
                  minWidth: 80,
                  onTap: () => vm.deleteHpl(),
                ),
                Spacer(flex: 3,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}