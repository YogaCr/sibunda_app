import 'package:aa_cob/cob_element.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/util/ui.dart';
import 'package:core/util/_consoles.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';

class CobFieldFaker extends StatefulWidget {
  final Widget child;

  CobFieldFaker({
    required this.child,
  });

  @override
  _CobFieldFakerState createState() => _CobFieldFakerState(
    child: child,
  );
}



class _CobFieldFakerState extends State<CobFieldFaker> {
  final Widget child;
  final faker = Faker();
  BuildContext? targetCtx;

  _CobFieldFakerState({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Builder(
          builder: (ctx) {
            targetCtx = ctx;
            return child;
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.all(10),
            child: TxtBtn(
              "Fill fields",
              onTap: () {
                if(targetCtx != null) {
                  visitNestedChildren(targetCtx!, (child) {
                    prind("CobFieldFaker visitNestedChildren() child = $child type = ${child.runtimeType}");
                    if(child is CobElement) {
                      child.liveData.value = faker.lorem.words(3).join(" ");
                    }
                  });
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    targetCtx = null;
    super.dispose();
  }
}