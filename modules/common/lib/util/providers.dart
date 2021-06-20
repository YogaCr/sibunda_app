
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension BlocForWidget on Widget {
  Widget inBlocProvider<B extends BlocBase<Object?>>(B Function(BuildContext) blocBuilder) => BlocProvider<B>(
    create: blocBuilder,
    child: this,
  );
}

extension VmForWidget on Widget {
  Widget inVmProvider(List<ViewModel Function(BuildContext)> vmCreators) => ViewModelProvider(
    creators: vmCreators,
    child: this,
  );
}