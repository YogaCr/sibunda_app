
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
  ///returns `null` if there is no matches for given [int] and [String],
  final bool? Function(int, String)? txtValidator;
  final bool _builderHasBeenInit;

  BlocMultiFieldFormBuilder({
    required List<Widget Function(BuildContext, BlocFormState, int)> builders,
    this.errorTxtMap,
    this.txtValidator,
  }) : _builderHasBeenInit = true,
        super(builders: builders);

  BlocMultiFieldFormBuilder.defaultInputField({
    this.errorTxtMap,
    this.txtValidator,
  }) : _builderHasBeenInit = false,
        super._();

  @override
  Widget build(BuildContext context) {
    if(!_builderHasBeenInit){
      final bloc = BlocProvider.of<Bloc>(context);
      builders = List.generate(bloc.fieldCount, (index) => (ctx, formState, i) {
        print("BlocMultiFieldFormBuilder builder BlocType= $Bloc i= $index bloc.labelKeyPairList[i] = ${bloc.labelKeyPairList[i]} build");
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: TxtInput(
            label: bloc.labelKeyPairList[i].item2,
            textController: bloc.inputTxtList[i],
            textValidator: (txt) => txtValidator?.call(i, txt) ?? (bloc.inputValidityList[i].value = txt.isNotEmpty),
            errorText: errorTxtMap?[i] ?? Strings.please_enter_your_name,
          ),
        );
      });
    }

    final widgets = List<Widget>.generate(builders.length, (index) => BlocBuilder<Bloc, BlocFormState>(
        builder: (ctx, state) => builders[index](ctx, state, index))
    );
    return Column(
      children: widgets,
    );
  }
}