/*
The widgets in this file is different than the ones in `popup_widget.dart`.
Overlays are intended to just overlay an existing widgets. The overlays
don't have to be full screen, while popups will overlay existing widgets at full screen.
 */


import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';

class BelowTopBarOverlay extends StatelessWidget {
  final Widget child;
  final bool autoCancel;
  final MutableLiveData<bool> visibilityController;
  final void Function()? onCancel;

  BelowTopBarOverlay({
    required this.child,
    this.autoCancel = true,
    this.onCancel,
    MutableLiveData<bool>? visibilityController,
  }):
    this.visibilityController = visibilityController ?? MutableLiveData(true)
  ;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final horizontalMargin = screenSize.width *0.8 / 10;

    return LiveDataObserver<bool>(
      immediatelyBuildState: true,
      liveData: visibilityController,
      builder: (ctx, isVisible) => Visibility(
        visible: isVisible == true,
        child: GestureDetector(
          onTap: () {
            if(autoCancel) {
              visibilityController.value = visibilityController.value != true;
            }
            onCancel?.call();
          },
          child: Container(
            color: black_trans_more,
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    prind("`autoCancel` cancelled");
                  }, //to cancel the autoCancel GestureDetector's onTap.
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(
                      minHeight: 10,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: horizontalMargin,)
                        .copyWith(bottom: 20, top: stdTopMargin),
                    child: child,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}