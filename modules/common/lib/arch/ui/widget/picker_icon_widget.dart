import 'package:common/arch/di/db_di.dart';
import 'package:common/arch/domain/model/_model_template.dart';
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
    return InkWell(
      onTap: () async {
        final selected = await showCitySelectionPopup(context: context, dao: DbDi.cityDao,);
        onItemSelected?.call(selected);
      },
      child: Icon(Icons.place_outlined,),
    );
  }
}