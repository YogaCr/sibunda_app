
import 'package:common/config/_config.dart';
import 'package:common/data/model/kehamilanku_data.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/page/secondary_frames.dart';
import 'package:common/ui/widget/_basic_widget.dart';
import 'package:common/ui/widget/bloc/BlocFormBuilder.dart';
import 'package:common/ui/widget/bloc/result_builder.dart';
import 'package:common/ui/widget/items_kehamilanku.dart';
import 'package:common/util/functions/ui_ext.dart';
import 'package:common/value/const_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sibunda_app/bloc/event/kehamilanku_home_event.dart';
import 'package:sibunda_app/bloc/kehamilanku_bloc.dart';
import 'package:common/util/functions/nav_ext.dart';
import 'package:sibunda_app/bloc/state/kehamilanku_home_state.dart';
import 'package:common/ui/adapter/form_warning_adp.dart';
import 'package:common/data/model/form_warning_status.dart';

class KehamilankuTrimesterFormPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final trimester = getArgs<MotherTrimester>(context, Const.KEY_TRIMESTER)!;

    final pregnancyBloc = BlocProvider.of<PregnancyHomeBloc>(context);
    pregnancyBloc.add(GetBabySize(0));
    
    final warningStatusList = <FormWarningStatus>[
      FormWarningStatus(
        desc: "Berat Badan Bunda kurang sesuai ya Bun. ",
        action: "Lihat rekomendasi makanan",
        isSafe: false,
        imgLink: "",
      ),
      FormWarningStatus(
        desc: "Denyut Jantung Janin Bunda kurang ya. Silahkan periksa ke faskes ya Bun",
        action: "Cari Faskes terdekat",
        isSafe: false,
        imgLink: "",
      ),
      FormWarningStatus(
        desc: "Selamat Bunda! \nTinggi Fundus Uterus Bunda normal ya Bun.",
        action: "Cari Faskes terdekat",
        isSafe: true,
        imgLink: "",
      ),
    ];

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
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 5),
                    child: Text(
                      "Form Pemeriksaan Bunda",
                      style: SibTextStyles.size_0_bold,
                    ),
                  ),
                ]),
              ),
              FormWarningSliverList(warningStatusList),
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 5),
                    child: Text(
                      "Informasi Hasil Pemeriksaan",
                      style: SibTextStyles.size_0_bold,
                    ),
                  ),
                  BlocMultiFieldFormBuilder<PregnancyCheckBloc>.defaultInputField(),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      margin: EdgeInsets.all(20).copyWith(bottom: 100),
                      child: TxtBtn(
                        "Simpan Data Pemeriksaan",
                        onTap: () => Navigator.pop(context),
                      ),
/*
                      InkWell(

                        splashColor: Manifest.theme.colorPrimary,
                        //hoverColor: Manifest.theme.colorPrimary,
                        child: Ink(
                          height: 50, width: 100,
                          child: Text("hagahogaigjag"),
                          color: Colors.blue,
                        ),
                        onTap: () => showSnackBar(context, "aufhaoijf"),
                      ),
 */
                    ),
                  ),
                ]),
              ),
            ],
        ),
      ),
    );
  }
}