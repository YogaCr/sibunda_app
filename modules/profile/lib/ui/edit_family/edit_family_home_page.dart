import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/config/profile_routes.dart';
import 'package:profile/ui/edit_family/edit_family_home_vm.dart';

class EditFamilyHomePage extends StatelessWidget {
  const EditFamilyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<EditFamilyHomeVm>(context)
      ..getFamilyData();

    return LiveDataObserver<List<Profile>>(
      liveData: vm.familyDataList,
      builder: (ctx, data) {
        if(data == null) return defaultLoading();
        if(data.isEmpty) return defaultNoData();
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (ctx, i) => InkWell(
            onTap: () => _toEditPage(
              context: ctx,
              i: i,
              profile: data[i],
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: grey_calm,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ItemProfile.fromData(data[i]),
              ),
            ),
          )
        );
      },
    );
  }

  void _toEditPage({
    required BuildContext context,
    required int i,
    required Profile profile,
  }) {
    switch(i) {
      case 0: // for mother
        ProfileRoutes.obj.goToExternalRoute(
          context, GlobalRoutes.home_motherFormPage,
          args: GlobalRoutes.makeHomeMotherFatherFormPageData(
            canSkip: false,
            credential: ProfileCredential.fromProfile(profile),
          ),
        );
        break;
      case 1: // for father
        ProfileRoutes.obj.goToExternalRoute(
          context, GlobalRoutes.home_fatherFormPage,
          args: GlobalRoutes.makeHomeMotherFatherFormPageData(
            canSkip: false,
            credential: ProfileCredential.fromProfile(profile),
          ),
        );
        break;
      default:
        ProfileRoutes.obj.goToExternalRouteBuilder(
          context, GlobalRoutes.home_childFormPage,
          args: GlobalRoutes.makeHomeChildFormPageData(
            isEdit: true,
            credential: ProfileCredential.fromProfile(profile),
          ),
        );
    }
  }
}
