import 'package:common/arch/domain/model/education_data.dart';
import 'package:common/arch/ui/page/secondary_frames.dart';
import 'package:common/arch/ui/widget/_basic_widget.dart';
import 'package:common/arch/ui/widget/_items_education.dart';
import 'package:common/config/manifest.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/util/assets.dart';
import 'package:common/util/navigations.dart';
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/ui/base/view_model.dart';
import 'package:education/ui/detail/education_detail_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';

class EducationDetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final tips = getArgs<Tips>(context, Const.KEY_DATA);
    if(tips == null) {
      throw "$runtimeType needs `Tips` argument with key '${Const.KEY_DATA}'";
    }

    final vm = ViewModelProvider.of<EducationDetailVm>(context)
      ..getDetail(tips);

    final imageChild = ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child:  AspectRatio(
        aspectRatio: tipsPanelWidth / tipsPanelHeight,
        child: SibImages.resolve(tips.img, fit: BoxFit.cover),
      ),
    );

    final title = Text(
      tips.title,
      style: SibTextStyles.size_plus_2.copyWith(fontWeight: FontWeight.bold),
    );

    final kind = Text(
      tips.kind,
      style: SibTextStyles.size_plus_1.copyWith(
        color: Manifest.theme.colorPrimary,
        fontWeight: FontWeight.bold,
      ),
    );

    final dateWidget = LiveDataObserver<String>(
      liveData: vm.dateStr,
      builder: (ctx, data) => data != null
          ? Text(
              data,
              style: SibTextStyles.size_min_1.copyWith(color: grey),
          ) : defaultLoading(),
    );

    final desc = LiveDataObserver<TipsDetail>(
      liveData: vm.detail,
      builder: (ctx, data) => data != null
          ? Html(
              data: data.desc,
              //style: SibTextStyles.size_min_1,
          ) : defaultLoading(),
    );

    return TopBarTitleAndBackFrame(
      withTopOffset: true,
      title: "Artikel",
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10,),
        child: BelowTopBarScrollContentArea(slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              imageChild,
              SizedBox(height: 20,),
              title,
              SizedBox(height: 15,),
              kind,
              SizedBox(height: 10,),
              dateWidget,
              SizedBox(height: 15,),
              desc,
              SizedBox(height: 10,),
            ]),
          ),
        ]),
      ),
    );
  }
}