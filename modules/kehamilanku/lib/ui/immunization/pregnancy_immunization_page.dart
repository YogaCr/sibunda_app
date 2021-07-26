import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/ui/adapter/immunization_adp.dart';
import 'package:common/arch/ui/model/dummy_ui_data.dart';
import 'package:common/arch/ui/model/immunization.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_item_immunization.dart';
import 'package:common/util/ui.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kehamilanku/config/kehamilanku_routes.dart';
import 'package:kehamilanku/ui/immunization/pregnancy_immunization_vm.dart';

class PregnancyImmunizationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<PregnancyImmunizationVm>(context)
      ..getImmunizationOverview()
      ..getImmunizationGroups(motherNik: "");

    return TopBarTitleAndBackFrame(
      withTopOffset: true,
      title: "Imunisasi Bunda",
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
                  LiveDataObserver<List<UiImmunizationListGroup>>(
                    liveData: vm.immunizationGroups,
                    //liveDataGetter: (vm2) => vm2.immunizationGroups,
                    builder: (ctx, data) => data != null ? ImmunizationListGroupView(
                      data,
                      onBtnClick: (group, child) async {
                        //showSnackBar(ctx, "group= $group child= $child");
                        final immData = data[group].immunizationList[child].core;
                        prind("Immunization page group= $group child= $child immData= $immData immData.date= ${immData.date}");
                        if(immData.date != null) {
                          showSnackBar(context, "Immunisasi sudah dilakukan", backgroundColor: Colors.green);
                          return;
                        }
                        final date = await KehamilankuRoutes.immunizationPopup.popup(
                          context: ctx,
                          immunization: immData,
                          pregnancyCred: vm.pregnancyId,
                        );
                        if(date != null) {
                          vm.onConfirmSuccess(group: group, child: child, date: date);
                          showSnackBar(context, "Berhasil mengonfirmasi", backgroundColor: Colors.green);
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