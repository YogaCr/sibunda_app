import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/util/_consoles.dart';

/// Controls each field
class FieldController<T> extends MutableLiveData<T> {
  final FormUiData fieldData;
  FieldController(this.fieldData);
  bool isEnabled = true;
}

/// Controls each group
class FormInterceptor extends MutableLiveData<FormUiGroupData> {
  final Map<String, FieldController> fieldControllers = {};
  //bool isEnabled = true;

  @override
  void notifyObservers({FormUiGroupData? oldValue, FormUiGroupData? newValue}) {
    disposeAllControllers();

    final newVal = newValue ?? value;
    if(newVal != null) {
      _assignNewControllers(newVal);
    }

    super.notifyObservers(
      oldValue: oldValue,
      newValue: newValue,
    );
  }
  void _assignNewControllers(FormUiGroupData formData) {
    prind("FormInterceptor `_assignNewControllers()`");
    for(final fieldData in formData.data) {
      switch(fieldData.type) {
        case FormType.radio:
          fieldControllers[fieldData.key] = FieldController<String>(fieldData);
          break;
        case FormType.check:
          fieldControllers[fieldData.key] = FieldController<Set<int>>(fieldData);
          break;
        default:
          fieldControllers[fieldData.key] = FieldController(fieldData);
      }
    }
  }
  void disposeAllControllers() {
    prind("FormInterceptor `disposeAllControllers()`");
    for(final controller in fieldControllers.values) {
      controller.dispose();
    }
    fieldControllers.clear();
  }
  FieldController? operator [](String key) => fieldControllers[key];

  @override
  void dispose() {
    disposeAllControllers();
    super.dispose();
  }
}

/// Controls all groups
class FormGroupInterceptor extends MutableLiveData<List<LiveData<FormUiGroupData>>> {
  final List<FormInterceptor> formControllers = [];
  //bool isEnabled = true;

  @override
  void notifyObservers({List<LiveData<FormUiGroupData>>? oldValue, List<LiveData<FormUiGroupData>>? newValue}) {
    disposeAllControllers();

    final newVal = newValue ?? value;
    if(newVal != null) {
      _assignNewControllers(newVal);
    }

    super.notifyObservers(
      oldValue: oldValue,
      newValue: newValue,
    );
  }

  void _assignNewControllers(List<LiveData<FormUiGroupData>> formData) {
    prind("FormGroupInterceptor `_assignNewControllers()`");
    if(formControllers.isNotEmpty) {
      throw "Can't call `_assignNewControllers()` while `formControllers` is not empty";
    }
    for(final group in formData) {
      final controller = FormInterceptor();
      controller.observeOther(group);
      if(group.value != null) {
        controller.value = group.value;
      }
      formControllers.add(controller);
    }
  }

  void disposeAllControllers() {
    prind("FormGroupInterceptor `disposeAllControllers()`");
    for(final controller in formControllers) {
      controller.dispose();
    }
    formControllers.clear();
  }

  FormInterceptor operator [](int group) => formControllers[group];

  @override
  void dispose() {
    disposeAllControllers();
    super.dispose();
  }
}