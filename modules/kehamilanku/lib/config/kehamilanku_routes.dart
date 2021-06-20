import 'package:common/arch/ui/page/_page.dart';
import 'package:common/config/_config.dart';
import 'package:kehamilanku/ui/home/kehamilanku_home_page.dart';

class KehamilankuRoutes extends ModuleRoute {
  KehamilankuRoutes._() : super(GlobalRoutes.manager);
  static final obj = KehamilankuRoutes._();

  @override
  SibRoute get entryPoint => kehamilankuHomePage;

  @override
  final String name = GlobalRoutes.kehamilanku;

  @override
  Set<SibRoute> get routes => {
    kehamilankuHomePage,
  };


  static final kehamilankuHomePage = SibRoute("KehamilankuHomePage", KehamilankuHomePage, (ctx) => MainFrame(
    body: KehamilankuHomePage(),
  ));
}