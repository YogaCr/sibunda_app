
import 'package:common/config/_config.dart';
import 'package:common/data/model/kehamilanku_data.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/page/secondary_frames.dart';
import 'package:common/ui/widget/bloc/BlocFormBuilder.dart';
import 'package:common/ui/widget/bloc/result_builder.dart';
import 'package:common/ui/widget/items_kehamilanku.dart';
import 'package:common/value/const_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibunda_app/bloc/event/kehamilanku_home_event.dart';
import 'package:sibunda_app/bloc/kehamilanku_bloc.dart';
import 'package:common/util/functions/nav_ext.dart';
import 'package:sibunda_app/bloc/state/kehamilanku_home_state.dart';

class KehamilankuTrimesterFormPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final trimester = getArgs<MotherTrimester>(context, Const.KEY_TRIMESTER)!;

    final pregnancyBloc = BlocProvider.of<PregnancyHomeBloc>(context);
    pregnancyBloc.add(GetBabySize(0));

    return TopBarTitleAndBackFrame(
      isScroll: true,
      title: "Trimester ${trimester.trimester}",
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: BelowTopBarScrollContentArea(
            [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  buildReactiveBlocBuilder<
                      PregnancyHomeBloc, PregnancyHomeState,
                      OnPregnancyBabySizeDataChanged, PregnancyBabySize
                  >(
                    stateDataGetter: (state) => state.data,
                    blocDataGetter: (bloc) => bloc.babySize,
                    builder: (data) => ItemMotherBabySizeOverview.fromData(data),
                  ),
/*
                  ItemMotherBabySizeOverview(
                    image: Container(color: Manifest.theme.colorPrimary,),
                    sizeString: "Selada kampung",
                    babyLen: 20.4,
                    babyWeight: 10,
                  ),
 */
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 5),
                    child: Text(
                      "Form Pemeriksaan Bunda",
                      style: SibTextStyles.size_0_bold,
                    ),
                  ),
                  BlocMultiFieldFormBuilder<PregnancyCheckBloc>.defaultInputField(),
                ]),
              ),
            ],
        ),
      ),
    );
  }
}