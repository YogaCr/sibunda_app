
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/material.dart';
import 'package:home/config/home_routes.dart';
import 'package:home/ui/form_get_started/children_count_vm.dart';

class ChildrenCountPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<ChildrenCountVm>(context);

    final now = DateTime.now();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          Strings.mother_children_data,
          style: SibTextStyles.header1,
        ), //TODO hardcode string
        SibImages.get("ilstr_mother_carry_baby.png", package: "common",) //TODO
            .withMargin(EdgeInsets.symmetric(horizontal: 50).copyWith(top: 70)),
        Text("Berapa anak yang Bunda punya?",),
        NumberPicker(
          onNumberChange: (i) => showSnackBar(context, "Dipencet i = $i"),
          max: 11,
        ),
        TxtInputUnderline(
          overText: "Tanggal lahir anak terakhir",
          textController: vm.lastChildBirthDateTxtControl,
          onSuffixIconClick: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: now,
              firstDate: DateTime(now.year -1),
              lastDate: DateTime(now.year +1),
            );
            vm.lastChildBirthDate.value = date;
          },
        ),
        FloatingActionButton(
          child: Icon(Icons.arrow_forward_rounded),
          onPressed: () => HomeRoutes.childFormPage.goToPage(context),
        ),
      ],
    );
  }
}