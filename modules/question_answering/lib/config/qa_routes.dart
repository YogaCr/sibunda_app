import 'package:common/arch/domain/model/chart_data_mother.dart';
import 'package:common/arch/domain/model/immunization.dart';
import 'package:common/arch/domain/model/kehamilanku_data.dart';
import 'package:common/arch/domain/model/profile_data.dart';
import 'package:common/arch/ui/page/_page.dart';
import 'package:common/arch/ui/widget/form_controller.dart';
import 'package:common/arch/ui/widget/form_faker.dart';
import 'package:common/arch/ui/widget/form_faker_enabler.dart';
import 'package:common/config/_config.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:common/util/providers.dart';
import 'package:common/util/navigations.dart' as nav_ext;
import 'package:common/value/const_values.dart';
import 'package:core/ui/base/live_data.dart';
import 'package:core/ui/base/live_data_observer.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter/material.dart';
import 'package:question_answering/ui/article_page.dart';
import 'package:question_answering/ui/qa_page.dart';


class QaRoutes extends ModuleRoute {
  QaRoutes._() : super(GlobalRoutes.manager);
  static final obj = QaRoutes._();

  @override
  SibRoute get entryPoint => qaHomePage;

  @override
  final String name = GlobalRoutes.qa;

  @override
  Set<SibRoute> get routes =>
      {
        qaHomePage,
        artikelQaPage
      };

  static final qaHomePage = SibRoute("QaHomePage", QuestionAnsweringPage, (ctx) => MainFrame(
    body: QuestionAnsweringPage(),
  ));

  static final artikelQaPage = SibRoute("ArtikelQaPage", MarkdownDisplayPage,(ctx)=>MainFrame(
    body: MarkdownDisplayPage(),
  ));
}