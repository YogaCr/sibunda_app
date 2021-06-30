import 'package:common/data/Result.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:flutter/cupertino.dart';

import 'package:common/config/manifest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// Build [Widget] based on type of [Result] derivatives ([Success], [Fail], and [Loading]).
Widget buildResult<T>({
  required Result<T> result,
  required Widget Function(T) builder,
  Widget Function(Fail)? onError,
  Widget Function(Loading)? onLoading,
}) {
  if(result is Success<T>) {
    return builder(result.data);
  } else if(result is Fail<T>) {
    return (onError ?? ((it) => Text("Error loading data")))(result);
  } else if(result is Loading<T>) {
    return (onLoading ?? ((it) => Text("Loading data...")))(result);
  }
  throw "No such result kind ($result)";
}

/// Build [Widget] based on type of [Result] derivatives ([Success], [Fail], and [Loading]) like [buildResult].
/// This function give additional features to bloc that preserves the current value of [Data]
/// and build new [Widget] with the current [Data].
Widget Function(BuildContext, S) buildReactiveBlocBuilderFunction<
  B extends BlocBase<S>,
  S,
  SuccessState extends S,
  Data
>({
  //required B bloc,
  //required BuildContext context,
  required Result<Data> Function(SuccessState) stateDataGetter,
  required Data? Function(B) blocDataGetter,
  //required Result<T> result,
  required Widget Function(Data) builder,
  Widget Function(Fail)? onError,
  Widget Function(Loading)? onLoading,
  Widget? defaultWidget,

  //Widget Function(Data) builder,
}) {
  Data? blocData;
  Widget? oldWidget;
  B? currentBloc;
  return (ctx, state) {
    final bloc = (currentBloc ??= BlocProvider.of<B>(ctx));
    return (state is SuccessState)
        ? (oldWidget = buildResult<Data>(
            result: stateDataGetter(state),
            builder: builder,
        ))
        : (oldWidget ??= ((blocData = blocDataGetter(bloc)) != null)
          ? builder(blocData!)
          : null) ?? defaultWidget ?? defaultLoading; //buildResult(result: result, builder: builder),
  };
}


Widget buildReactiveBloc<
  B extends BlocBase<S>,
  S,
  SuccessState extends S,
  Data
>(
  BuildContext context, S state,
{
  required Result<Data> Function(SuccessState) stateDataGetter,
  required Data? Function(B) blocDataGetter,
  required Widget Function(Data) builder,
  Widget Function(Fail)? onError,
  Widget Function(Loading)? onLoading,
  Widget? defaultWidget,
}) => buildReactiveBlocBuilderFunction(
  stateDataGetter: stateDataGetter,
  blocDataGetter: blocDataGetter,
  builder: builder,
  onError: onError,
  onLoading: onLoading,
  defaultWidget: defaultWidget
)(context, state);


BlocBuilder<B, S> buildReactiveBlocBuilder<
  B extends BlocBase<S>,
  S,
  SuccessState extends S,
  Data
>({
  //required B bloc,
  //required BuildContext context,
  required Result<Data> Function(SuccessState) stateDataGetter,
  required Data? Function(B) blocDataGetter,
  //required Result<T> result,
  required Widget Function(Data) builder,
  Widget Function(Fail)? onError,
  Widget Function(Loading)? onLoading,
  Widget? defaultWidget,
  //Widget Function(Data) builder,
}) => BlocBuilder<B, S>(
  builder: buildReactiveBlocBuilderFunction<B, S, SuccessState, Data>(
    stateDataGetter: stateDataGetter,
    blocDataGetter: blocDataGetter,
    builder: builder,
    onError: onError,
    onLoading: onLoading,
    defaultWidget: defaultWidget,
  ),
);

/*
//TODO: Ubah jadi fungsi biar gak merubah tipe dari RenderBox ke SliverRenderBox dan sebaliknya.
class ResultBuilder<T> extends StatelessWidget {
  final Result<T> result;
  final Widget Function(T) builder;
  final Widget Function(Fail) onError;
  final Widget Function(Loading) onLoading;

  ResultBuilder({
    required this.result,
    required this.builder,
    Widget Function(Fail)? onError,
    Widget Function(Loading)? onLoading,
  }):
    this.onError = onError ?? ((it) => Text("Error loading data")),
    this.onLoading = onLoading ?? ((it) => Text("Loading data..."))
  ;

  @override
  Widget build(BuildContext context) {
    if(result is Success<T>) {
      return builder((result as Success<T>).data);
    } else if(result is Fail) {
      return onError(result as Fail);
    } else if(result is Loading) {
      return onLoading(result as Loading);
    }
    throw "No such result kind ($result)";
  }
}




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
 */