
import 'package:common/bloc/form_bloc.dart';
import 'package:common/res/string/_string.dart';
import 'package:common/ui/widget/TxtInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocFormBuilder<Bloc extends FormBloc> extends StatelessWidget {
  late final List<Widget Function(BuildContext, BlocFormState, int)> builders;

  BlocFormBuilder({
    required this.builders,
  });

  BlocFormBuilder._();

  @override
  Widget build(BuildContext context) {
    final widgets = List<Widget>.generate(builders.length, (index) => BlocBuilder<Bloc, BlocFormState>(
        builder: (ctx, state) => builders[index](ctx, state, index))
    );
    return Column(
      children: widgets,
    );
  }
}

class BlocMultiFieldFormBuilder<Bloc extends MultiFieldFormBloc> extends BlocFormBuilder<Bloc> {
  final Map<int, String>? errorTxtMap;
  final bool builderHasBeenInit;

  BlocMultiFieldFormBuilder({
    required List<Widget Function(BuildContext, BlocFormState, int)> builders,
    this.errorTxtMap,
  }) : builderHasBeenInit = true,
        super(builders: builders);

  BlocMultiFieldFormBuilder.defaultInputField({
    this.errorTxtMap
  }) : builderHasBeenInit = false,
        super._();

  @override
  Widget build(BuildContext context) {
    if(!builderHasBeenInit){
      final bloc = BlocProvider.of<MultiFieldFormBloc>(context);
      builders = List.generate(bloc.fieldCount, (index) => (ctx, formState, i) => TxtInput(
        label: bloc.labelKeyPairList[i].item1,
        textController: bloc.inputTxtList[i],
        textValidator: (txt) => bloc.inputValidityList[i].value = txt.isNotEmpty,
        errorText: errorTxtMap?[i] ?? Strings.please_enter_your_name,
      ),);
    }

    final widgets = List<Widget>.generate(builders.length, (index) => BlocBuilder<Bloc, BlocFormState>(
        builder: (ctx, state) => builders[index](ctx, state, index))
    );
    return Column(
      children: widgets,
    );
  }
}