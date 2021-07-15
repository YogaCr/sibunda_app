import 'package:common/arch/di/db_di.dart';
import 'package:common/arch/domain/model/_model_template.dart';
import 'package:common/arch/ui/model/dummy_ui_data.dart';
import 'package:common/arch/ui/widget/popup_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityPickerIcon extends StatelessWidget {
  final void Function(IdStringModel?)? onItemSelected;

  CityPickerIcon({
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () async {
        final selected = await showCitySelectionPopup(context: context, dao: DbDi.cityDao,);
        onItemSelected?.call(selected);
      },
      child: Icon(Icons.place_outlined,),
    );
  }
}

class GenderPickerIcon extends StatelessWidget {
  final void Function(IdStringModel?)? onItemSelected;

  GenderPickerIcon({
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () async {
        final selected = await showGenderSelectionPopup(context: context,);
        onItemSelected?.call(selected);
      },
      child: Icon(ic_gender,),
    );
  }
}