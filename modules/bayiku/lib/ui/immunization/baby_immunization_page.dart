import 'package:bayiku/config/baby_routes.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/ui/adapter/immunization_adp.dart';
import 'package:common/arch/ui/model/dummy_ui_data.dart';
import 'package:common/arch/ui/model/immunization.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_item_immunization.dart';
import 'package:common/util/navigations.dart';
import 'package:common/util/ui.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'baby_immunization_vm.dart';

class BabyImmunizationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final vm = ViewModelProvider.of<BabyImmunizationVm>(context)
      //..babyNik.value = babyNik
      ..getImmunizationOverview()
      ..getImmunizationGroups();

    return TopBarTitleAndBackFrame(
      withTopOffset: true,
      title: "Imunisasi Bayi",
      body: BelowTopBarScrollContentArea(
        slivers: [SliverList(
          delegate: SliverChildListDelegate.fixed([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,),
              child: Column(
                children: [
                  LiveDataObserver<ImmunizationOverview>(
                    liveData: vm.overview,
                    builder: (ctx, data) => data != null
                        ? ImmunizationOverviewView.fromData(data)
                        : SizedBox(),
                  ),
                  AsyncVmObserver<BabyImmunizationVm, List<UiImmunizationListGroup>>(
                    liveDataGetter: (vm) => vm.immunizationGroups,
                    onFailBuilder: (ctx, key, fail) => key == BabyImmunizationVm.getImmunizationGroupsKey
                        ? defaultError() : null,
                    builder: (ctx, data) => data != null ? ImmunizationListGroupView(
                      data,
                      onBtnClick: (group, child) async {
                        final immData = data[group].immunizationList[child].core;
                        if(immData.date != null) {
                          showSnackBar(ctx, "Immunisasi sudah dilakukan", backgroundColor: Colors.green);
                          return;
                        }
                        final result = await BabyRoutes.immunizationPopup.popup(
                          context: ctx,
                          immunization: immData,
                          babyCredential: vm.credential,
                        );
                        if(result != null) {
                          vm.onConfirmSuccess(group: group, child: child, result: result);
                          showSnackBar(ctx, "Berhasil mengonfirmasi", backgroundColor: Colors.green);
                        }
                      },
                    ) : defaultLoading(),
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