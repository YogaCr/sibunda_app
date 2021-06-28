import 'package:bayiku/config/baby_routes.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/ui/adapter/immunization_adp.dart';
import 'package:common/arch/ui/model/dummy_ui_data.dart';
import 'package:common/arch/ui/model/immunization.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_item_immunization.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'baby_immunization_vm.dart';

class BabyImmunizationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<BabyImmunizationVm>(context)
      ..getImmunizationOverview()
      ..getImmunizationGroups(babyNik: "");

    return TopBarTitleAndBackFrame(
      isScroll: true,
      title: "Imunisasi Bayi",
      body: BelowTopBarScrollContentArea([
        SliverList(
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
                  LiveDataObserver<List<UiImmunizationListGroup>>(
                    liveData: vm.immunizationGroups,
                    //liveDataGetter: (vm2) => vm2.immunizationGroups,
                    builder: (ctx, data) => ImmunizationListGroupView(
                      data ?? List.empty(),
                      onBtnClick: (group, child) async {
                        //showSnackBar(ctx, "group= $group child= $child");
                        final immData = data![group].immunizationList[child].core;
                        if(immData.date != null) {
                          showSnackBar(ctx, "Immunisasi sudah dilakukan", backgroundColor: Colors.green);
                          return;
                        }
                        final result = await BabyRoutes.immunizationPopup.popup(ctx, immData,);
                        if(result != null) {
                          vm.onConfirmSuccess(group: group, child: child, result: result);
                          showSnackBar(ctx, "Berhasil mengonfirmasi", backgroundColor: Colors.green);
                        }
                      },
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