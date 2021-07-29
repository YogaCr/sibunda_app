import 'package:async/async.dart';
import 'package:common/arch/domain/model/form_data.dart';
import 'package:common/arch/ui/model/form_data.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/ui.dart';
import 'package:core/domain/model/range.dart';
import 'package:core/domain/model/wrapper.dart';
import 'package:core/util/_consoles.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormFaker extends StatelessWidget {
  final Widget child;
  /// This widget shouldn't have any gesture detector or this [FormFaker]
  /// can't detect whether the btn is clicked or not.
  final Widget? btn;
  /// If this is null, then [btn] won't be displayed and [child] will be
  /// returned immediately.
  final FormGroupInterceptor? interceptor;
  final Faker faker;
  //bool isFakerShown;

  //CancelableOperation? countDownOperation;
  //int nearTap = 0;
  //Var<bool>? tapCancellation;

  FormFaker({
    required this.child,
    this.interceptor,
    this.btn,
    Faker? faker,
  }): this.faker = faker ?? Faker()
  ;

  @override
  Widget build(BuildContext context) {
    if(interceptor == null) {
      return child;
    }

    void fillForm() {
      //prind("fillForm() interceptor!.formControllers = ${interceptor!.formControllers}");
      //if(!interceptor!.isEnabled) return;

      for(final formInterceptor in interceptor!.formControllers) {
        //if(!formInterceptor.isEnabled) continue;
        for(final fieldInterceptor in formInterceptor.fieldControllers.values) {
          final fieldData = fieldInterceptor.fieldData;
          prind("fillForm() fieldData = $fieldData fieldInterceptor.isEnabled = ${fieldInterceptor.isEnabled}");
          if(!fieldInterceptor.isEnabled || !fieldData.isInputEnabled)
            continue; //Well, the purpose of `FormFaker` is to fake form input by manual.
          switch(fieldData.type) {
            case FormType.radio:
              if((fieldData as FormUiRadio).selectedAnswer == null) {
                final len = fieldData.answerItems.length;
                fieldInterceptor.value = fieldData.answerItems[faker.randomGenerator.integer(len)];
              }
              break;
            case FormType.check:
              if((fieldData as FormUiCheck).selectedAnswers.isEmpty) {
                final len = fieldData.answerItems.length;
                final willBeFilled = faker.randomGenerator.integer(len);
                final answers = <int>{};
                for(final i in range(willBeFilled)) {
                  final u = faker.randomGenerator.integer(len);
                  answers.add(u);
                }
                fieldInterceptor.value = answers;
              }
              break;
            case FormType.text:
              switch((fieldData as FormUiTxt).input) {
                case FieldInputMethod.pickDate:
                  fieldInterceptor.value = faker.date.dateTime();
                  break;
                case FieldInputMethod.pickTime:
                  final date = faker.date.dateTime();
                  fieldInterceptor.value = TimeOfDay.fromDateTime(date);
                  break;

                case FieldInputMethod.direct:
                  switch(fieldData.inputType) {
                    case InputType.int:
                      fieldInterceptor.value = faker.randomGenerator.integer(100000);
                      break;
                    case InputType.number:
                      fieldInterceptor.value = faker.randomGenerator.decimal(scale: 300);
                      break;
                    case InputType.email:
                      final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
                      fieldInterceptor.value = timestamp +faker.internet.email();
                      break;
                    case InputType.password:
                    //prind("FormFaker InputType.password len = $len");
                      fieldInterceptor.value = faker.internet.password(
                        length: faker.randomGenerator.integer(30, min: 8),
                      );
                      break;
                    case InputType.person:
                      fieldInterceptor.value = faker.person.name();
                      break;
                    case InputType.char:
                      fieldInterceptor.value = faker.lorem.word()[0].toUpperCase();
                      break;
                    case InputType.any:
                    case InputType.text:
                    default:
                      fieldInterceptor.value = faker.lorem.sentence();
                  }
                  break;
                default: prinw("Can't fill automatically to `TxtField` with `input` of `FieldInputMethod.pick`, `key` = '${fieldData.key}'");
              }
              break;
            case FormType.imgPick:
              prinw("Can't fill automatically to `ImgPickerField`, `key` = '${fieldData.key}'");
          }
          //prind("fillForm() fieldInterceptor.value = ${fieldInterceptor.value}");
        }
      }
    }

    final btn = this.btn != null ? GestureDetector(
      child: this.btn,
      onTap: fillForm,
    ) : Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: EdgeInsets.all(5),
        child: TxtBtn(
          "Fill Form",
          onTap: fillForm,
        ),
      ),
    );

    return Stack(
      children: [
        child,
        btn,
      ],
    );
  }
/*
  //TODO: Pikirkan cara terbaik tuk dispose `interceptor`.
  @override
  void dispose() {
    interceptor?.dispose();
    super.dispose();
  }
 */
}



/*

class FormFaker extends StatefulWidget {
  final Widget child;
  /// This widget shouldn't have any gesture detector or this [FormFaker]
  /// can't detect whether the btn is clicked or not.
  final Widget? btn;
  /// If this is null, then [btn] won't be displayed and [child] will be
  /// returned immediately.
  final FormGroupInterceptor? interceptor;
  final Faker faker;

  FormFaker({
    required this.child,
    this.interceptor,
    this.btn,
    Faker? faker,
  }): this.faker = faker ?? Faker()
  ;

  @override
  State createState() => _FormFakerState(
    child: child,
    interceptor: interceptor,
    btn: btn,
    faker: faker,
  );
}

class _FormFakerState extends State<FormFaker> {
}
 */