import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/domain/model/home_graph_menu.dart';
import 'package:common/arch/ui/model/immunization.dart';

final motherHomeGraph_ui = <HomeGraphMenu>[
  HomeGraphMenu(name: 'Grafik Evaluasi Kehamilan', imgLink: '',),
  HomeGraphMenu(name: 'Grafik Berat Badan', imgLink: '',),
];

final babyHomeGraph_ui = <HomeGraphMenu>[
  HomeGraphMenu(name: 'Pertumbuhan Bayi', imgLink: '',),
  HomeGraphMenu(name: 'Perkembangan Bayi', imgLink: '',),
];


final motherHomeImmunization_ui = HomeImmunizationData(
  action: "Lihat imunisasi Bunda",
  title: "Jangan lupa ikut imunisasi ya Bunda",
  imgLink: "",
);

final babyHomeImmunization_ui = HomeImmunizationData(
  action: "Lihat imunisasi Bayi",
  title: "Jangan lupa ikut imunisasi Bayi ya Bun",
  imgLink: "",
);


final motherImmunizationDetailList_ui = List<ImmunizationListItem>.generate(
    motherImmunizationDetailList.length,
    (i) => ImmunizationListItem.fromModelDetail(motherImmunizationDetailList[i])
);
final babyImmunizationDetailList_ui = List<ImmunizationListItem>.generate(
    babyImmunizationDetailList.length,
    (i) => ImmunizationListItem.fromModelDetail(babyImmunizationDetailList[i])
);

/*
TODO lanjutkan motherImmunizationGroupList_ui
final motherImmunizationGroupList_ui = List<ImmunizationListGroup>.generate(
    motherImmunizationDetailList.length,
        (i) => ImmunizationListItem.fromModelDetail(motherImmunizationDetailList[i])
);
 */