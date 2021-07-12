import 'package:core/ui/base/live_data.dart';
import 'package:flutter/cupertino.dart';

abstract class CobElement extends Element {
  CobElement(Widget widget) : super(widget);
  MutableLiveData get liveData;
}

class CobStatelessElement
    extends StatelessElement
    implements CobElement {

  CobStatelessElement({
    required StatelessWidget widget,
    required this.liveData,
  }) : super(widget);

  final MutableLiveData liveData;
}

class CobStatefulElement
    extends StatefulElement
    implements CobElement {

  CobStatefulElement({
    required StatefulWidget widget,
    required this.liveData,
  }) : super(widget);

  final MutableLiveData liveData;
}

class CobKey extends LocalKey {

}