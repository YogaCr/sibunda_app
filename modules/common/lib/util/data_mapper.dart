
import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/ui/model/form_data.dart';

List<FormUiGroupData> formDataListToUi(List<FormGroupData> data) =>
    data.map((e) => FormUiGroupData.fromModel(e)).toList(growable: false);


String getMotherChartTypeString(MotherChartType type) {
  switch(type) {
    case MotherChartType.tfu: return "Tinggi Fundus Uterus";
    case MotherChartType.djj: return "Denyut Jantung Janin";
    case MotherChartType.map: return "Denyut Nadi Bunda";
    case MotherChartType.bmi: return "Indeks Berat Badan";
  }
}