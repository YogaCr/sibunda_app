import 'dart:async';

import 'package:common/core/ui/expirable.dart';
import 'package:common/core/ui/live_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';

part 'view_model_provider.dart';
part 'view_model_observer.dart';


abstract class ViewModel {
  bool _isActive = true;
  bool get isActive => _isActive;
  List<LiveData<dynamic>> get liveDatas;

  void _dispose() {
    _isActive = false;
    for(final ld in liveDatas) {
      ld.dispose();
    }
    dispose();
  }
  void dispose() {}
}

