import 'package:common/arch/domain/dummy_data.dart';
import 'package:common/arch/ui/model/immunization.dart';

import 'home_graph_menu.dart';

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


final motherImmunizationOverview_ui = UiImmunizationOverview(text: "Yuk cek apakah Bunda sudah mendapatkan semua imunisasi ya Bun", imgLink: "");
final babyImmunizationOverview_ui = UiImmunizationOverview(text: "Yuk cek apakah Bayi sudah mendapatkan semua imunisasi ya Bun", imgLink: "");

final motherImmunizationDetailList_ui = List<UiImmunizationListItem>.generate(
    motherImmunizationDetailList.length,
    (i) => UiImmunizationListItem.fromModelDetail(motherImmunizationDetailList[i])
);
final babyImmunizationDetailList_ui = List<UiImmunizationListItem>.generate(
    babyImmunizationDetailList.length,
    (i) => UiImmunizationListItem.fromModelDetail(babyImmunizationDetailList[i])
);

/*
TODO lanjutkan motherImmunizationGroupList_ui
final motherImmunizationGroupList_ui = List<ImmunizationListGroup>.generate(
    motherImmunizationDetailList.length,
        (i) => ImmunizationListItem.fromModelDetail(motherImmunizationDetailList[i])
);
 */