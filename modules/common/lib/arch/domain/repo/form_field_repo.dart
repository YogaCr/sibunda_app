import 'package:common/arch/data/remote/api/baby_api.dart';
import 'package:common/arch/data/remote/api/covid_api.dart';
import 'package:common/arch/data/remote/api/kehamilanku_api.dart';
import 'package:common/arch/domain/dummy_form_field_data.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:core/domain/model/result.dart';

mixin FormFieldRepo {
  Future<Result<List<FormGroupData>>> getBabyFormGroupData(int month);
  Future<Result<List<FormGroupData>>> getPregnancyFormGroupData();
  Future<Result<List<FormGroupData>>> getPregnancyImmunizationFormGroupData();
  Future<Result<List<FormGroupData>>> getBabyImmunizationFormGroupData();
  Future<Result<List<FormGroupData>>> getCovidMotherCheckFormGroupData();
  Future<Result<List<FormGroupData>>> getCovidBabyCheckFormGroupData();

  Future<Result<List<FormGroupData>>> getNeonatalFormData(int page);
}



class FormFieldRepoImpl with FormFieldRepo {
  final BabyApi _babyApi;
  final CovidApi _covidApi;
  //final KehamilankuApi _motherApi;

  FormFieldRepoImpl({
    required BabyApi babyApi,
    required CovidApi covidApi,
    //required KehamilankuApi motherApi,
  }):
    _babyApi = babyApi,
    _covidApi = covidApi
    //_motherApi = motherApi
  ;

  //final KehamilankuApi _motherApi;

  @override
  Future<Result<List<FormGroupData>>> getBabyFormGroupData(int month) async {
    final resps = await _babyApi.getDevFormData(month);
    final res = <FormGroupData>[
      ...babyFormGroupData_growth,
    ];
    if(resps.isNotEmpty) {
      res.add(FormGroupData.fromBabyDevResponse(resps));
    }
    return Success(res);
  }
  @override
  Future<Result<List<FormGroupData>>> getPregnancyFormGroupData() async => Success(motherFormGroupData);
  @override
  Future<Result<List<FormGroupData>>> getPregnancyImmunizationFormGroupData() async => Success(pregnancyImmunizationFormGroupData);
  @override
  Future<Result<List<FormGroupData>>> getBabyImmunizationFormGroupData() async => Success(babyImmunizationFormGroupData);
  @override
  Future<Result<List<FormGroupData>>> getCovidMotherCheckFormGroupData() async {
    final resps = await _covidApi.getFormData();
    final res = FormGroupData.fromCovidResponse(resps.data);
    return Success([res]);
  }
  @override
  Future<Result<List<FormGroupData>>> getCovidBabyCheckFormGroupData() async {
    final resps = await _covidApi.getFormData();
    final res = FormGroupData.fromCovidResponse(resps.data);
    return Success([covidBabySelectionFormGroup, res]);
  }
  @override
  Future<Result<List<FormGroupData>>> getNeonatalFormData(int page) async => Success(getBabyNeonatalService(page));
}


class FormFieldRepoDummy with FormFieldRepo {
  FormFieldRepoDummy._();
  static final obj = FormFieldRepoDummy._();
  @override
  Future<Result<List<FormGroupData>>> getBabyFormGroupData(int month) async => Success(getBabyFormGroupData_dummy(month));
  @override
  Future<Result<List<FormGroupData>>> getPregnancyFormGroupData() async => Success(motherFormGroupData);
  @override
  Future<Result<List<FormGroupData>>> getPregnancyImmunizationFormGroupData() async => Success(pregnancyImmunizationFormGroupData);
  @override
  Future<Result<List<FormGroupData>>> getBabyImmunizationFormGroupData() async => Success(babyImmunizationFormGroupData);
  @override
  Future<Result<List<FormGroupData>>> getCovidMotherCheckFormGroupData() async => Success(covidMotherCheckFormGroupData);
  @override
  Future<Result<List<FormGroupData>>> getCovidBabyCheckFormGroupData() async => Success(covidMotherCheckFormGroupData);
  @override
  Future<Result<List<FormGroupData>>> getNeonatalFormData(int page) async => Success(babyFormGroupData_neonatal_6h);
}