import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_item_template.dart';
import 'package:common/arch/ui/widget/_items_education.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:education/ui/home/education_home_vm.dart';
import 'package:flutter/cupertino.dart';

class EducationHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<EducationHomeVm>(context)
        ..getMainPanel()
        ..getTipsList();

    return TopBarTitleAndBackFrame(
      isScroll: true,
      title: "Info dan Tips",
      body: BelowTopBarScrollContentArea([
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            LiveDataObserver<List<Tips>>(
              liveData: vm.mainPanelList,
              builder: (ctx, data) => Container(
                height: 150,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: _MainPanelList(data ?? List.empty(growable: false)),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Text(
                "Terkini",
                style: SibTextStyles.size_0_bold,
              ),
            ),
          ]),
        ),
        LiveDataObserver<List<Tips>>(
          liveData: vm.tipsList,
          builder: (ctx, data) => _TipsList(data ?? List.empty(growable: false)),
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
      itemBuilder: (ctx, i) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5,),
        child: ItemTipsHeaderPanel.fromData(dataList[i]),
      ),
    );
  }
}

class _TipsList extends StatelessWidget {
  final List<Tips> dataList;
  _TipsList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (ctx, i) => Container(
          margin: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: ItemTips.fromData(dataList[i]),
        ),
        childCount: dataList.length,
      ),
    );
  }
}