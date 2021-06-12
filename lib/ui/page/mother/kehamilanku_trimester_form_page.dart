
import 'package:common/config/_config.dart';
import 'package:common/res/theme/_theme.dart';
import 'package:common/ui/widget/bloc/BlocFormBuilder.dart';
import 'package:common/ui/widget/items_kehamilanku.dart';
import 'package:flutter/cupertino.dart';
import 'package:sibunda_app/bloc/family_form_bloc.dart';
import 'package:sibunda_app/bloc/kehamilanku_bloc.dart';

class KehamilankuTrimesterFormPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView(
        children: [
          ItemMotherBabySizeOverview(
            image: Container(color: Manifest.theme.colorPrimary,),
            sizeString: "Selada kampung",
            babyLen: 20.4,
            babyWeight: 10,
          ),
          Text(
            "Form Pemeriksaan Bunda",
            style: SibTextStyles.size_0_bold,
          ),
          BlocMultiFieldFormBuilder<PregnancyCheckBloc>.defaultInputField(), //TODO ganti jenis form bloc
        ],
      ),
    );
  }
}