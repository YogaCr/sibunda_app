import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/arch/ui/widget/form_faker.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/ui.dart';
import 'package:core/domain/model/wrapper.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';


class FormFakerEnabler extends StatefulWidget {
  final Widget Function(BuildContext, FormGroupInterceptor?) builder;
  final MutableLiveData<FormGroupInterceptor> liveInterceptor;
  final bool isLiveDataOwner;
  final bool showInDefault;

  FormFakerEnabler({
    required this.builder,
    MutableLiveData<FormGroupInterceptor>? liveInterceptor,
    bool? isLiveDataOwner,
    bool? showInDefault,
  }):
    liveInterceptor = liveInterceptor ?? MutableLiveData(),
    isLiveDataOwner = isLiveDataOwner ?? liveInterceptor == null,
    showInDefault = showInDefault ?? false
  ;

  @override
  _FormFakerEnablerState createState() => _FormFakerEnablerState(
    builder: builder,
    liveInterceptor: liveInterceptor,
    isLiveDataOwner: isLiveDataOwner,
    showInDefault: showInDefault,
  );
}

class _FormFakerEnablerState extends State<FormFakerEnabler> {
  final Widget Function(BuildContext, FormGroupInterceptor?) builder;
  final MutableLiveData<FormGroupInterceptor> liveInterceptor;
  final bool isLiveDataOwner;
  final bool showInDefault;

  //CancelableOperation? countDownOperation;
  int nearTap = 0;
  Var<bool>? tapCancellation;

  _FormFakerEnablerState({
    required this.builder,
    required this.liveInterceptor,
    required this.isLiveDataOwner,
    required this.showInDefault,
  });

  @override
  Widget build(BuildContext context) {
    final core = LiveDataObserver<FormGroupInterceptor>(
      liveData: liveInterceptor,
      isLiveDataOwner: isLiveDataOwner,
      builder: (ctx, data) {
        if(data == null) {
          return builder(context, null);
        }
        return FormFaker(
          interceptor: data,
          child: builder(context, data),
        );
      },
    );
    prind("_FormFakerEnablerState.build() core= $core");

    final enabler = GestureDetector(
      onTap: () {
        tapCancellation?.value = false;
        if(++nearTap >= 5) {
          setState(() {
            final interceptor = liveInterceptor.value =
              liveInterceptor.value == null ? FormGroupInterceptor() : null;
            if(interceptor != null) {
              showToast(msg: "Form interceptor is activated for this page");
            }
            nearTap = 0;
            tapCancellation = null;
          });
        } else {
          final newTapCancellation = tapCancellation = Var(true);
          //countDownOperation?.cancel();
          Future.delayed(Duration(milliseconds: 2000), () {
            prind("FormFaker delayed deact BEFORE nearTap= $nearTap newTapCancellation= $newTapCancellation");
            if(newTapCancellation.value) {
              prind("FormFaker delayed deact MASUK nearTap= $nearTap");
              nearTap = 0;
              tapCancellation = null;
            }
          });
        }
      },

      child: Container(
        color: Colors.transparent,
        height: 30,
        width: 30,
      ),
    );

    return Stack(
      children: [
        core,
        Align(
          alignment: Alignment.topRight,
          child: enabler,
        )
      ],
    );
  }

  @override
  void dispose() {
    tapCancellation?.value = false;
    tapCancellation = null;
    super.dispose();
  }
}
