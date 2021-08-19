import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/ui/adapter/education_adp.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/arch/ui/widget/_items_education.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:education/config/education_routes.dart';
import 'package:education/ui/home/education_home_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EducationHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<EducationHomeVm>(context)
        ..getMainPanel()
        ..getTipsList();

    return TopBarTitleAndBackFrame(
      withTopOffset: true,
      title: "Info dan Tips",
      body: BelowTopBarScrollContentArea(slivers: [
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            LiveDataObserver<List<Tips>>(
              liveData: vm.mainPanelList,
              builder: (ctx, data) {
                if(data == null) return defaultLoading();
                if(data.isEmpty) return defaultEmptyWidget();
                return Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: _MainPanelList(data),
                );
              },
            ),
            LiveDataObserver<List<Tips>>(
              liveData: vm.tipsList,
              builder: (ctx, data) => data != null ? Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Text(
                  "Terkini",
                  style: SibTextStyles.size_0_bold,
                ),
              ) : defaultEmptyWidget(),
            ),
          ]),
        ),
        LiveDataObserver<List<Tips>>(
          liveData: vm.tipsList,
          builder: (ctx, data) {
            if(data?.isNotEmpty != true) {
              return SliverToBoxAdapter(
                child: data == null
                    ? defaultLoading()
                    : defaultNoData(),
              );
            }
            return TipsSliverList(
              data!,
              onItemClick: (data) => EducationRoutes.detailPage.go(context, data),
            );
          },
        ),
      ]),
    );
  }
}


class _MainPanelList extends StatelessWidget {
  final List<Tips> dataList;
  _MainPanelList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dataList.length,
      itemBuilder: (ctx, i) => InkWell(
        onTap: () => EducationRoutes.detailPage.go(ctx, dataList[i]),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5,),
          child: ItemTipsHeaderPanel.fromData(dataList[i]),
        ),
      )
    );
  }
}