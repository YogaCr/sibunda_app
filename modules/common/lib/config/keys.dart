import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';

class CommonKeys {
  CommonKeys._();

  static const itemInfo_list = Key("item_info_list");
  static Key getItemInfoKey(int i) => Key("item_info_list_$i");
  static Key getBtnImmunizationItem(int occurenceId) {
    prind("getBtnImmunizationItem occurenceId= $occurenceId");
    return Key("btn_immunization_item_$occurenceId");
  }
}