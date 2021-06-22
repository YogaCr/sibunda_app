import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/ui/adapter/immunization_adp.dart';
import 'package:common/arch/ui/model/dummy_ui_data.dart';
import 'package:common/arch/ui/model/immunization.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_item_immunization.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_vm.dart';

class PregnancyImmunizationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ViewModelProvider.of<PregnancyImmunizationVm>(context)
      ..getImmunizationOverview()
      ..getImmunizationGroups(motherNik: "");

    return TopBarTitleAndBackFrame(
      isScroll: true,
      title: "Imunisasi Bunda",
      body: BelowTopBarScrollContentArea([
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,),
              child: Column(
                children: [
                  ImmunizationOverviewView.fromData(motherImmunizationOverview_ui),
                  AsyncVmObserver<PregnancyImmunizationVm, List<UiImmunizationListGroup>>(
                    liveDataGetter: (vm2) => vm2.immunizationGroups,
                    builder: (ctx, data) => ImmunizationListGroupView(
                      data ?? List.empty(),
                      onBtnClick: (group, child) => showSnackBar(ctx, "group= $group child= $child"),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}