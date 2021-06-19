import 'package:async/async.dart';
import 'package:common/core/domain/model/wrapper.dart';
import 'package:common/core/ui/base/expirable.dart';
import 'package:common/core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:tuple/tuple.dart';

/// [ViewModel] that is designed to manage various async process.
/// It can [cancelJob] async process before launching the same process based on [String] key.
/// It can can also invoke [_preAsyncTaskMap] before launching the async process.
abstract class AsyncVm extends ViewModel {
  
  /// Its values, is a [Tuple2] of [CancelableOperation] and [Var]<bool>.
  /// The [Var]<bool> is for indication of parent async process [CancelableOperation]
  /// whether the parent is active or not. The [Var]<bool> is useful since
  /// The [CancelableOperation] can't cancel the nested async process.
  /// The [Var]<bool> is useful in context of [startJob] invocation.
  /// Note that the [Var]<bool> can't guarantee to stop nested async process.
  /// So, the developers must be aware of the value inside [Var]<bool>.
  /// Developers can use the [Var]<bool> like this:
  ///
  /// startJob(`expirable`, (isActive) async {
  ///   ....
  ///   ....Start of nested async process block....
  ///     if(isActive.value) {
  ///       ....Do some nested async operation....
  ///     }
  ///   ....End of nested async process block....
  ///   ....
  /// });
  Map<String, Tuple2<CancelableOperation, Var<bool>>> _jobMap = {};

  /// For its values, the lambda returns [Widget].
  /// If not null, it means the widget will be rebuilt using the returned [Widget].
  /// If null, the old [Widget] will stay.
  Map<Expirable, void Function(String key)> _preAsyncTaskMap = {};

  @nonVirtual
  void addOnPreAsyncTask(Expirable observer, void Function(String key)? block) {
    if(block != null) {
      _preAsyncTaskMap[observer] = block;
    } else {
      _preAsyncTaskMap.remove(observer);
    }
  }

  @nonVirtual
  void doPreAsyncTask(String key){
    for(final observer in _preAsyncTaskMap.keys) {
      if(observer.isActive) {
        _preAsyncTaskMap[observer]!(key);
      } else {
        _preAsyncTaskMap.remove(observer);
      }
    }
  }

  @nonVirtual
  void cancelJob(String key) {
    final pair = _jobMap[key];
    if(pair != null) {
      pair.item1.cancel();
      pair.item2.value = false;
      _jobMap.remove(key);
    }
  }

  /// Use this method to [cancelJob] the previous async process with the same [key].
  /// then [doPreAsyncTask] before finally do the [block] process async.
  @nonVirtual
  void startJob(String key, Future<void> Function(Val<bool> isActive) block) {
    cancelJob(key);
    doPreAsyncTask(key);
    final isActive = Var(true);
    final pair = Tuple2(CancelableOperation.fromFuture(block(isActive)), isActive);
    _jobMap[key] = pair;
  }

  @override
  @mustCallSuper
  void dispose() {
    for(final key in _jobMap.keys) {
      cancelJob(key);
    }
    _jobMap.clear();
  }
}