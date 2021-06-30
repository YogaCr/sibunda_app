
import 'package:common/bloc/_bloc.dart';
import 'package:common/data/Result.dart';
import 'package:common/data/dummy_data.dart';
import 'package:common/data/model/kehamilanku_data.dart';
import 'package:common/data/repo/kehamilanku_repo.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/value/const_values.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibunda_app/bloc/event/kehamilanku_home_event.dart';
import 'package:sibunda_app/bloc/state/kehamilanku_home_state.dart';
import 'package:tuple/tuple.dart';

class PregnancyCheckBloc extends MultiFieldFormBloc {
  final PregnancyCheckRepo repo;
  PregnancyCheckBloc(this.repo) : super([
    Tuple2(Const.KEY_VISIT_DATE, Strings.visit_date),
    Tuple2(Const.KEY_VISIT_PLACE, Strings.visit_place),
    Tuple2(Const.KEY_CHECKER_NAME, Strings.checker_name),
    Tuple2(Const.KEY_MOTHER_DIFFICULTY, Strings.mother_difficulty),
    Tuple2(Const.KEY_PREGNANCY_AGE, Strings.pregnancy_age),
    Tuple2(Const.KEY_BABY_GENDER, Strings.baby_gender),
    Tuple2(Const.KEY_FUTURE_VISIT_DATE, Strings.future_visit_date),
    Tuple2(Const.KEY_HPHT, Strings.hpht),
    Tuple2(Const.KEY_HPL, Strings.hpl),
    Tuple2(Const.KEY_MOTHER_WEIGHT, Strings.mother_weight),
    Tuple2(Const.KEY_MOTHER_WEIGHT_DIFF, Strings.mother_weight_diff),
    Tuple2(Const.KEY_MOTHER_HEIGHT, Strings.mother_height),
    Tuple2(Const.KEY_TFU, Strings.tfu),
    Tuple2(Const.KEY_DJJ, Strings.djj),
    Tuple2(Const.KEY_SYSTOLIC_PRESSURE, Strings.systolic_pressure),
    Tuple2(Const.KEY_DIASTOLIC_PRESSURE, Strings.diastolic_pressure),
    Tuple2(Const.KEY_MAP, Strings.map),
    Tuple2(Const.KEY_BABY_MOVEMENT, Strings.baby_movement),
    Tuple2(Const.KEY_DRUG_PRESCRIPT, Strings.drug_prescript),
    Tuple2(Const.KEY_DRUG_ALLERGY, Strings.drug_allergy),
    Tuple2(Const.KEY_DISEASE_HISTORY, Strings.disease_history),
    Tuple2(Const.KEY_SPECIAL_NOTE, Strings.special_note),
  ]);

  
  @override
  Stream<BlocFormState> moreSpecificMapEventToState(FormEvent event) async* {
    if(event is SubmitForm) {
      if(canProceed) {
        final data = PregnancyCheck.from(event.formInputs);
        yield* sendData(data);
      } else {
        yield OnInvalidForm({}); //TODO 25 Mei 2021: Smtr ini mapnya kosong.
      }
    }
  }

  Stream<BlocFormState> sendData(PregnancyCheck data) async* {
    final resp = await repo.savePregnancyCheck(data);
    if(resp is Success<bool>) {
      yield OnSuccessEndForm();
    } else if(resp is Fail<bool>) {
      yield OnErrorSubmission(resp);
    }
  }
}


class PregnancyHomeBloc extends Bloc<PregnancyHomeEvent, PregnancyHomeState> {
  final MotherFoodRecomRepo foodRepo;
  final MotherPregnancyRepo pregnancyRepo;

  MotherPregnancyAgeOverview? _ageOverview;
  List<MotherTrimester>? _trimesterList;
  List<MotherFoodRecom>? _foodRecomList;
  PregnancyBabySize? _babySize;

  MotherPregnancyAgeOverview? get ageOverview => _ageOverview;
  List<MotherTrimester>? get trimesterList => _trimesterList;
  List<MotherFoodRecom>? get foodRecomList => _foodRecomList;
  PregnancyBabySize? get babySize => _babySize;

  PregnancyHomeBloc({
    required this.foodRepo,
    required this.pregnancyRepo,
  }): super(OnPregnancyHomeInit());

  @override
  Stream<PregnancyHomeState> mapEventToState(PregnancyHomeEvent event) async* {
    if(event is GetPregnancyAgeOverview) {
      final res = await pregnancyRepo.getMotherPregnancyAgeOverview();
      if(res is Success<MotherPregnancyAgeOverview>) {
        _ageOverview = res.data;
      }
      yield OnPregnancyHomeAgeOverviewDataChanged(res);
    } else if(event is GetTrimester) {
      final res = await pregnancyRepo.getMotherTrimester();
      if(res is Success<List<MotherTrimester>>) {
        _trimesterList = res.data;
      }
      yield OnPregnancyHomeTrimesterDataChanged(res);
    } else if(event is GetFoodRecom) {
      final res = await foodRepo.getMotherFoodRecoms(event.pregnancyWeekAge);
      if(res is Success<List<MotherFoodRecom>>) {
        _foodRecomList = res.data;
      }
      yield OnPregnancyHomeFoodRecomDataChanged(res);
    } else if(event is GetBabySize) {
      final res = await pregnancyRepo.getPregnancyBabySize(event.pregnancyWeekAge);
      if(res is Success<PregnancyBabySize>) {
        _babySize = res.data;
      }
      yield OnPregnancyBabySizeDataChanged(res);
    }
  }

}