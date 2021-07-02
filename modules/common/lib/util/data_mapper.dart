
import 'package:common/arch/domain/model/chart_data_baby.dart';
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
String getMotherChartTypeYLabelFormat(MotherChartType type) {
  switch(type) {
    case MotherChartType.tfu: return "{value} cm";
    case MotherChartType.djj: return "{value} x";
    case MotherChartType.map: return "{value} x";
    case MotherChartType.bmi: return "{value}";
  }
}

String getBabyChartTypeString(BabyChartType type) {
  switch(type) {
    case BabyChartType.kms: return "Berat Badan Menurut Usia";
    case BabyChartType.len: return "Panjang Badan Menurut Usia";
    case BabyChartType.weight: return "Berat Badan Menurut Usia";
    case BabyChartType.weightToLen: return "Berat Badan Menurut Panjang Badan";
    case BabyChartType.bmi: return "Indeks Massa Tubuh";
    case BabyChartType.head: return "Lingkar Kepala";
    case BabyChartType.dev: return "Perkembangan Bayi";
  }
}
String getBabyChartTypeYLabelFormat(BabyChartType type) {
  switch(type) {
    case BabyChartType.kms: return "{value} Kg";
    case BabyChartType.len: return "{value} cm";
    case BabyChartType.weight: return "{value} Kg";
    case BabyChartType.weightToLen: return "{value} Kg";
    case BabyChartType.bmi: return "{value} IMT";
    case BabyChartType.head: return "{value} cm";
    case BabyChartType.dev: return "{value} 'Ya'";
  }
}