import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import 'expirable.dart';
import 'live_data.dart';

part 'view_model_provider.dart';
part 'view_model_observer.dart';


abstract class ViewModel implements Expirable {
  bool _isActive = true;
  @override
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

