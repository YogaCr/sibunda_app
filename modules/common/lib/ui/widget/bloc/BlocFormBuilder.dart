
import 'package:common/bloc/form_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocFormBuilder<Bloc extends FormBloc> extends StatelessWidget {
  final List<Widget Function(BuildContext, BlocFormState)> builders;

  BlocFormBuilder({
    required this.builders,
  });

  @override
  Widget build(BuildContext context) {
    final widgets = List<Widget>.generate(builders.length, (index) => BlocBuilder<Bloc, BlocFormState>(builder: builders[index]));
    return Column(
      children: widgets,
    );
  }
}