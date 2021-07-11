import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_items_profile.dart';
import 'package:common/util/assets.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profile/config/profile_routes.dart';
import 'package:profile/ui/home/profile_home_vm.dart';


class ProfileHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<ProfileHomeVm>(context)
        ..getProfile();

    return TopBarTitleAndBackFrame(
      withTopOffset: true,
      title: "Profile",
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: BelowTopBarScrollContentArea(slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              LiveDataObserver<Profile>(
                liveData: vm.profile,
                builder: (ctx, data) => data != null
                    ? Column(
                      children: [
                        ItemProfilePic.fromData(data),
                        _MenuList(profile: data),
                      ],) : defaultLoading(),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}


class _MenuList extends StatelessWidget {
  final Profile profile;

  _MenuList({
    required this.profile
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => ProfileRoutes.profileEditPage.go(context, profile),
          child: ListTile(
            leading: SibImages.get("ic_profile_sm.png", package: "common"),
            title: Text("Edit Profil"),
          ),
        ),
        InkWell(
          child: ListTile(
            leading: SibImages.get("ic_wallet.png", package: "common"),
            title: Text("Edit Data Profil"),
          ),
        ),
        InkWell(
          child: ListTile(
            leading: SibImages.get("ic_verified.png", package: "common"),
            title: Text("Pusat Bantuan"),
          ),
        ),
      ],
    );
  }
}