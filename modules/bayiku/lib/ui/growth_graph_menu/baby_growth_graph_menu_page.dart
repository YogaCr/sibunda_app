import 'package:bayiku/ui/growth_graph_menu/baby_growth_graph_menu_vm.dart';
import 'package:common/arch/domain/model/baby_data.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_items_bayiku.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:core/ui/base/async_view_model_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:flutter/cupertino.dart';

class BabyGrowthGraphMenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = ViewModelProvider.of<BabyGrowthGraphMenuVm>(context)
      ..getMenu();

    return TopBarTitleAndBackFrame(
      isScroll: true,
      title: "Grafik Pertumbuhan",
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: BelowTopBarScrollContentArea([
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 10,),
              child: Text(
                "Silahkan pilih grafiknya dulu ya Bun",
                style: SibTextStyles.size_0_bold,
              ),
            ),
          ),
          AsyncVmObserver<BabyGrowthGraphMenuVm, List<BabyGraphMenuData>>(
            vm: vm,
            liveDataGetter: (vm2) => vm2.menuList,
            builder: (ctx, dataList) => _GrowthGraphMenuList(dataList ?? List.empty()),
          ),
        ]),
      ),
    );
  }
}

class _GrowthGraphMenuList extends StatelessWidget {
  final List<BabyGraphMenuData> dataList;
  _GrowthGraphMenuList(this.dataList);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (ctx, i) => Container(
            margin: EdgeInsets.symmetric(vertical: 5,),
            child: ItemBabyGraphMenu.fromData(dataList[i]),
          ),
        childCount: dataList.length,
      ),
    );
  }
}