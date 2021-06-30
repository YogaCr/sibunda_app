
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension BlocForWidget on Widget {
  Widget inBlocProvider<B extends BlocBase<Object?>>(B Function(BuildContext) blocBuilder) => BlocProvider<B>(
    create: blocBuilder,
    child: this,
  );
}