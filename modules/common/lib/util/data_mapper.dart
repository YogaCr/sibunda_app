
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/ui/model/form_data.dart';

List<FormUiGroupData> formDataListToUi(List<FormGroupData> data) =>
    data.map((e) => FormUiGroupData.fromModel(e)).toList(growable: false);