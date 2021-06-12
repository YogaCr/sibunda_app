
import 'package:common/bloc/_bloc.dart';
import 'package:common/data/Result.dart';
import 'package:common/data/repo/family_repo.dart';
import 'package:common/data/model/family_data.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/value/const_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:tuple/tuple.dart';
/*
abstract class FamilyFormBloc extends MultiFieldFormBloc {
  final FamilyRepo repo;
  //FamilyFormBloc(this.repo, int fieldCount, [List<String>? inputKeyList]): super(fieldCount, inputKeyList);
  FamilyFormBloc(
      this.repo,
      List<Tuple2<String, String>> labelKeyPairList,
//      int fieldCount, [List<String>? inputKeyList],
  ): super(labelKeyPairList);
/*
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
 */
}
 */

class MotherFormBloc extends MultiFieldFormBloc {
  final MotherRepo repo;
  MotherFormBloc(this.repo) : super([
    Tuple2(Const.KEY_NAME, Strings.name),
    Tuple2(Const.KEY_NIK, Strings.nik),
    Tuple2(Const.KEY_SALARY, Strings.salary),
    Tuple2(Const.KEY_JKN, Strings.jkn),
    Tuple2(Const.KEY_FASKES1, Strings.faskes1),
    Tuple2(Const.KEY_FASKES_RUJUKAN, Strings.faskes_rujukan),
    Tuple2(Const.KEY_BLOOD_TYPE, Strings.blood_type),
    Tuple2(Const.KEY_BIRTH_PLACE, Strings.birth_place),
    Tuple2(Const.KEY_BIRTH_DATE, Strings.birth_date),
    Tuple2(Const.KEY_EDUCATION, Strings.education),
    Tuple2(Const.KEY_OCCUPANCY, Strings.occupancy),
    Tuple2(Const.KEY_ADDRESS, Strings.address),
    Tuple2(Const.KEY_PHONE, Strings.phone),
    Tuple2(Const.KEY_PUSKESMAS_DOMISILI, Strings.puskesmas_domisili),
    Tuple2(Const.KEY_COHORT_REG, Strings.cohort_no),
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
    final resp = await repo.saveMotherData(data);
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


class FatherFormBloc extends MultiFieldFormBloc {
  final FatherRepo repo;
  FatherFormBloc(this.repo) : super([
    Tuple2(Const.KEY_NAME, Strings.name),
    Tuple2(Const.KEY_NIK, Strings.nik),
    Tuple2(Const.KEY_SALARY, Strings.salary),
    Tuple2(Const.KEY_JKN, Strings.jkn),
    Tuple2(Const.KEY_FASKES1, Strings.faskes1),
    Tuple2(Const.KEY_FASKES_RUJUKAN, Strings.faskes_rujukan),
    Tuple2(Const.KEY_BLOOD_TYPE, Strings.blood_type),
    Tuple2(Const.KEY_BIRTH_PLACE, Strings.birth_place),
    Tuple2(Const.KEY_BIRTH_DATE, Strings.birth_date),
    Tuple2(Const.KEY_EDUCATION, Strings.education),
    Tuple2(Const.KEY_OCCUPANCY, Strings.occupancy),
    Tuple2(Const.KEY_ADDRESS, Strings.address),
    Tuple2(Const.KEY_PHONE, Strings.phone),
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
    final resp = await repo.saveFatherData(data);
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

//TODO
class ChildFormBloc extends MultiFieldFormBloc {
  final ChildRepo repo;
  ChildFormBloc(this.repo) : super([
    Tuple2(Const.KEY_NAME, Strings.name),
    Tuple2(Const.KEY_NIK, Strings.nik),
    Tuple2(Const.KEY_JKN, Strings.jkn),
    Tuple2(Const.KEY_BLOOD_TYPE, Strings.blood_type),
    Tuple2(Const.KEY_BIRTH_PLACE, Strings.birth_place),
    Tuple2(Const.KEY_BIRTH_DATE, Strings.birth_date),
    Tuple2(Const.KEY_CHILD_ORDER, Strings.child_order),
    Tuple2(Const.KEY_GENDER, Strings.gender),
    Tuple2(Const.KEY_BIRTH_CERT_NO, Strings.birth_cert_no),
    Tuple2(Const.KEY_JKN_START_DATE, Strings.jkn_start_date),
    Tuple2(Const.KEY_BABY_COHORT_REG, Strings.baby_cohort_no),
    Tuple2(Const.KEY_TODDLER_COHORT_REG, Strings.toddler_cohort_no),
    Tuple2(Const.KEY_HOSPITAL_MEDIC_NO, Strings.hospital_medic_no),
  ]);

  //TODO 5 Juni 2021.
  @override
  Stream<BlocFormState> moreSpecificMapEventToState(FormEvent event) async* {
    if(event is SubmitForm) {
      if(canProceed) {
        final data = Child.from(event.formInputs);
        yield* sendChildData(data);
      } else {
        yield OnInvalidForm({}); //TODO 25 Mei 2021: Smtr ini mapnya kosong.
      }
    }
  }

  Stream<BlocFormState> sendChildData(Child data) async* {
    final resp = await repo.saveChildData(data);
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
