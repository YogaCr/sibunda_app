import 'package:common/core/ui/bloc/form_bloc.dart';
import 'package:common/core/ui/widget/txt_input.dart';
import 'package:common/res/string/_string.dart';
import 'package:core/domain/model/result.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/expirable.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';

class FormBlocObserver<B extends FormBloc>
    extends StatefulWidget
{
  final bool? Function(int, String)? txtValidator;

  /// Its keys are key to [FormBloc.txtKeyLabelList], not the label.
  final Map<String, String>? errorTxtMap;

  /// The [bool] in its parameter is for representation of [FormBloc.canProceed].
  final Widget Function(BuildContext, bool?) submitBtnBuilder;

  /// The [String] in its parameter is for async key from [FormBloc.doPreAsyncTask].
  final Widget? Function(BuildContext, String)? preSubmitBtnBuilder;

  final void Function(bool)? onSubmit;

  FormBlocObserver({
    required this.submitBtnBuilder,
    this.preSubmitBtnBuilder,
    this.txtValidator,
    this.errorTxtMap,
    this.onSubmit,
  });

  @override
  FormBlocObserverState<B> createState() => FormBlocObserverState(
    submitBtnBuilder: submitBtnBuilder,
    preSubmitBtnBuilder: preSubmitBtnBuilder,
    txtValidator: txtValidator,
    errorTxtMap: errorTxtMap,
    onSubmit: onSubmit,
  );
}
class FormBlocObserverState<B extends FormBloc>
    extends State<FormBlocObserver<B>>
    implements Expirable
{
  final bool? Function(int, String)? txtValidator;

  /// Its keys are key to [FormBloc.txtKeyLabelList], not the label.
  final Map<String, String>? errorTxtMap;

  /// The [bool] in its parameter is for representation of [FormBloc.canProceed].
  final Widget Function(BuildContext, bool?) submitBtnBuilder;

  /// The [String] in its parameter is for async key from [FormBloc.doPreAsyncTask].
  final Widget? Function(BuildContext, String)? preSubmitBtnBuilder;

  final void Function(bool)? onSubmit;

  FormBlocObserverState({
    required this.submitBtnBuilder,
    this.preSubmitBtnBuilder,
    this.txtValidator,
    this.errorTxtMap,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = ViewModelProvider.of<B>(context);
    final keyLabelList = bloc.txtKeyLabelList;

    final formWidgets = List<Widget>.generate(
      keyLabelList.length,
          (i) => AsyncVmObserver<B, bool>(
            liveDataGetter: (vm) => vm.isTxtValidList[i],
            distinctUntilChanged: true,
            builder: (ctx, isValid) => TxtInput(
              label: bloc.txtKeyLabelList[i].item2,
              textController: bloc.txtControllerList[i],
              errorText: isValid == false ? (errorTxtMap?[i] ?? Strings.please_enter_your_name) : null,
            ),
          ),
    );

    final submitBtn = AsyncVmObserver<B, bool>(
      liveDataGetter: (vm) => vm.canProceed,
      distinctUntilChanged: true,
      builder: (ctx, canProceed) => GestureDetector(
        child: submitBtnBuilder(ctx, canProceed),
        onTap: () {
          print("SignUpPage.onTap() submit canProceed= $canProceed");
          if(canProceed == true) {
            bloc.submit();
          }
        },
      ),
      preAsyncBuilder: preSubmitBtnBuilder,
    );
    formWidgets.add(
      Container(
        margin: EdgeInsets.only(top: 10,),
        child: submitBtn,
      ),
    );

    bloc.onSubmit.observe(this, (result) {
      if(result != null) {
        onSubmit?.call(result is Success<String>);
      }
    });

    return Column(
      children: formWidgets,
    );
  }

  bool _isActive = true;
  @override
  bool get isActive => _isActive;

  @override
  void dispose() {
    _isActive = false;
    super.dispose();
  }
}