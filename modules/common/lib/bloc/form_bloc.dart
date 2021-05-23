
import 'form_state.dart';
import 'form_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  void submitForm();
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