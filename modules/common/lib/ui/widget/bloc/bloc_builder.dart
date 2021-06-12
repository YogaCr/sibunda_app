
import 'package:common/config/manifest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocPreAsyncBuilder<
  B extends BlocBase<S>,
  S,
  Sactual extends S,
  Data
> extends StatelessWidget {
  final Data Function(Sactual) stateDataGetter;
  final Data? Function(B) blocDataGetter;
  final Widget Function(Data) builder;
  //final Widget Function(BuildContext, Sactual) stateBuilder;
  //final Widget? Function(BuildContext, B) blocBuilder;
  final Widget preAsyncChild;

  BlocPreAsyncBuilder({
    required this.stateDataGetter,
    required this.blocDataGetter,
    required this.builder,
    Widget? preAsyncChild,
  }): this.preAsyncChild = preAsyncChild ?? Container(
    height: 100,
    color: Manifest.theme.colorPrimary,
  );

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<B>(context);
    Data? blocData;
    Widget? oldWidget;
    return BlocBuilder<B, S>(
      builder: (ctx, state) => (state is Sactual)
          ? oldWidget = builder(stateDataGetter(state))
          : (oldWidget ??= ((blocData = blocDataGetter(bloc)) != null)
          ? builder(blocData!)
          : null) ?? preAsyncChild,
    );
  }
}