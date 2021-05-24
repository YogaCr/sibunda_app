
import 'package:common/bloc/_bloc.dart';
import 'package:common/data/Result.dart';
import 'package:common/data/repo/family_repo.dart';
import 'package:common/data/model/family_data.dart';
import 'package:common/value/const_values.dart';
import 'package:flutter/cupertino.dart';

abstract class FamilyFormBloc extends MultiFieldFormBloc {
  final FamilyRepo repo;
  FamilyFormBloc(this.repo, int fieldCount, [List<String>? inputKeyList]): super(fieldCount, inputKeyList);

  final puskesmasDomisiliTxt = TextEditingController();
  final cohortRegistNoTxt = TextEditingController();
  final nameTxt = TextEditingController();
  final nikTxt = TextEditingController();
  final salaryTxt = TextEditingController();
  final jknTxt = TextEditingController();
  final faskes1Txt = TextEditingController();
  final faskesRujukanTxt = TextEditingController();
  final bloodTypeTxt = TextEditingController();
  final birthCityTxt = TextEditingController();
  final birthDateTxt = TextEditingController();
  final educationTxt = TextEditingController();
  final occupancyTxt = TextEditingController();
  final addressTxt = TextEditingController();
  final phoneTxt = TextEditingController();


}

class MotherFormBloc extends FamilyFormBloc {
  MotherFormBloc(FamilyRepo repo) : super(repo, 15, [
    Const.KEY_NAME,
    Const.KEY_NIK,
    Const.KEY_SALARY,
    Const.KEY_JKN,
    Const.KEY_FASKES1,
    Const.KEY_FASKES_RUJUKAN,
    Const.KEY_BLOOD_TYPE,
    Const.KEY_BIRTH_PLACE,
    Const.KEY_BIRTH_DATE,
    Const.KEY_EDUCATION,
    Const.KEY_OCCUPANCY,
    Const.KEY_ADDRESS,
    Const.KEY_PHONE,
    Const.KEY_PUSKESMAS_DOMISILI,
    Const.KEY_COHORT_REG,
  ]);

  @override
  Stream<BlocFormState> moreSpecificMapEventToState(FormEvent event) async* {
    if(event is SubmitForm) {
      if(canProceed) {
        final data = Mother.from(event.formInputs);
        yield* sendMotherData(data);
      } else {
        yield OnInvalidForm({}); //TODO 25 Mei 2021: Smtr ini mapnya kosong.
      }
    }
  }

  Stream<BlocFormState> sendMotherData(Mother data) async* {
    final resp = await repo.sendMotherData(data);
    if(resp is Success<bool>) {
      yield OnSuccessEndForm();
    } else if(resp is Fail<bool>) {
      yield OnErrorSubmission(resp);
    }
  }
/*
  Stream<BlocFormState> getMotherData(String nik) async* {
    final resp = await repo.getMotherData(nik);
    if(resp is Success<Mother>) {
      yield OnSuccessEndForm({ Const.KEY_DATA : resp.data });
    } else if(resp is Fail<Mother>) {
      yield OnErrorSubmission(resp);
    }
  }
 */
/*
  @override
  void submitForm([Map<String, String?>? extras]) {
    add(SubmitForm({
      Const.KEY_NAME : nameTxt.text,
      Const.KEY_NIK : nikTxt.text,
      Const.KEY_SALARY : salaryTxt.text,
      Const.KEY_JKN : jknTxt.text,
      Const.KEY_FASKES1 : faskes1Txt.text,
      Const.KEY_FASKES_RUJUKAN : faskesRujukanTxt.text,
      Const.KEY_BLOOD_TYPE : bloodTypeTxt.text,
      Const.KEY_BIRTH_PLACE : birthCityTxt.text,
      Const.KEY_BIRTH_DATE : birthDateTxt.text,
      Const.KEY_EDUCATION : educationTxt.text,
      Const.KEY_OCCUPANCY : occupancyTxt.text,
      Const.KEY_ADDRESS : addressTxt.text,
      Const.KEY_PHONE : phoneTxt.text,
      Const.KEY_PUSKESMAS_DOMISILI : puskesmasDomisiliTxt.text,
      Const.KEY_COHORT_REG : cohortRegistNoTxt.text,
    }));
  }
 */
}


class FatherFormBloc extends FamilyFormBloc {
  FatherFormBloc(FamilyRepo repo) : super(repo, 13, [
    Const.KEY_NAME,
    Const.KEY_NIK,
    Const.KEY_SALARY,
    Const.KEY_JKN,
    Const.KEY_FASKES1,
    Const.KEY_FASKES_RUJUKAN,
    Const.KEY_BLOOD_TYPE,
    Const.KEY_BIRTH_PLACE,
    Const.KEY_BIRTH_DATE,
    Const.KEY_EDUCATION,
    Const.KEY_OCCUPANCY,
    Const.KEY_ADDRESS,
    Const.KEY_PHONE,
  ]);

  @override
  Stream<BlocFormState> moreSpecificMapEventToState(FormEvent event) async* {
    if(event is SubmitForm) {
      if(canProceed) {
        final data = Father.from(event.formInputs);
        yield* sendFatherData(data);
      } else {
        yield OnInvalidForm({}); //TODO 25 Mei 2021: Smtr ini mapnya kosong.
      }
    }
  }

  Stream<BlocFormState> sendFatherData(Father data) async* {
    final resp = await repo.sendFatherData(data);
    if(resp is Success<bool>) {
      yield OnSuccessEndForm();
    } else if(resp is Fail<bool>) {
      yield OnErrorSubmission(resp);
    }
  }
/*
  Stream<BlocFormState> getMotherData(String nik) async* {
    final resp = await repo.getMotherData(nik);
    if(resp is Success<Mother>) {
      yield OnSuccessEndForm({ Const.KEY_DATA : resp.data });
    } else if(resp is Fail<Mother>) {
      yield OnErrorSubmission(resp);
    }
  }
 */
/*
  @override
  void submitForm([Map<String, String?>? extras]) {
    add(SubmitForm({
      Const.KEY_NAME : nameTxt.text,
      Const.KEY_NIK : nikTxt.text,
      Const.KEY_SALARY : salaryTxt.text,
      Const.KEY_JKN : jknTxt.text,
      Const.KEY_FASKES1 : faskes1Txt.text,
      Const.KEY_FASKES_RUJUKAN : faskesRujukanTxt.text,
      Const.KEY_BLOOD_TYPE : bloodTypeTxt.text,
      Const.KEY_BIRTH_PLACE : birthCityTxt.text,
      Const.KEY_BIRTH_DATE : birthDateTxt.text,
      Const.KEY_EDUCATION : educationTxt.text,
      Const.KEY_OCCUPANCY : occupancyTxt.text,
      Const.KEY_ADDRESS : addressTxt.text,
      Const.KEY_PHONE : phoneTxt.text,
      Const.KEY_PUSKESMAS_DOMISILI : puskesmasDomisiliTxt.text,
      Const.KEY_COHORT_REG : cohortRegistNoTxt.text,
    }));
  }
 */
}
