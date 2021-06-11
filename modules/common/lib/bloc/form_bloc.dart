
import 'package:common/util/prop.dart';
import 'package:flutter/cupertino.dart';

import 'form_state.dart';
import 'form_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';

export 'form_event.dart';
export 'form_state.dart';

abstract class FormBloc extends Bloc<FormEvent, BlocFormState> {
  FormBloc([BlocFormState? initialState]) : super(initialState ?? OnInitForm());

  @override
  Stream<BlocFormState> mapEventToState(FormEvent event) async* {
    if(event is InitForm) yield OnInitForm();
    else yield* specificMapEventToState(event);
  }

  @override
  Stream<BlocFormState> specificMapEventToState(FormEvent event);

  void submitForm([Map<String, String?>? extras]);
/*
  List<bool> createValidityList(int size, [List<int>? errorIndeces]) {
    if(errorIndeces == null) return List.generate(size, (index) => true);

    var errorIndecesI = 0;
    return List.generate(size, (index) {
      var indexOfErrorIndex = errorIndeces.indexOf(index, errorIndecesI);
      if(indexOfErrorIndex >= 0){
        errorIndecesI++;
        return false;
      }
      return true;
    });
*/
}

afa(){
  Tuple2<String, int> ada;
}

abstract class MultiFieldFormBloc extends FormBloc {
  final int fieldCount;
  final List<LiveProp<bool>> inputValidityList;
  final List<TextEditingController> inputTxtList;
//  final List<String> inputKeyList;
  final List<Tuple2<String, String>> labelKeyPairList;

  bool _canProceed = false;
  bool get canProceed => _canProceed;

  MultiFieldFormBloc(
//      this.fieldCount,
//      [List<String>? inputKeyList],
      this.labelKeyPairList,
  ):
    this.fieldCount = labelKeyPairList.length,
    inputValidityList = List.generate(labelKeyPairList.length, (index) => LiveProp(false), growable: false),
    inputTxtList = List.generate(labelKeyPairList.length, (index) => TextEditingController(), growable: false)
//    inputKeyList = inputKeyList ?? List.generate(fieldCount, (index) => "", growable: false)
  {
    //if(inputKeyList != null && inputKeyList.length != fieldCount)
      //throw "inputKeyList.length (${inputKeyList.length}) should be same as fieldCount= ($fieldCount)";
    for(final prop in inputValidityList) {
      prop.onChanged = (v) => checkCanProceed();
    }
  }

  bool checkCanProceed() {
    var newCanProceed = true;
    for(final prop in inputValidityList) {
      newCanProceed &= prop.value;
      if(!newCanProceed) break;
    }
    if(_canProceed != newCanProceed) {
      _canProceed = newCanProceed;
      add(CheckCanProceed());
    }
    return _canProceed;
  }


  @override
  Stream<BlocFormState> specificMapEventToState(FormEvent event) async* {
    if(event is CheckCanProceed) {
      yield OnCanProceedChanged(_canProceed);
    } else {
      yield* moreSpecificMapEventToState(event);
    }
  }

  Stream<BlocFormState> moreSpecificMapEventToState(FormEvent event);
  @override
  void submitForm([Map<String, String?>? extras]) {
    final map = <String, String>{};
    for(int i = 0; i < fieldCount; i++) {
      map[labelKeyPairList[i].item1] = inputTxtList[i].text;
    }
    add(SubmitForm(map));
  }
}