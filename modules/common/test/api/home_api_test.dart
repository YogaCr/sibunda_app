import 'package:common/arch/data/remote/api/home_api.dart';
import 'package:common/arch/di/api_di.dart';
import 'package:common/test/__common_test_const.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter_test/flutter_test.dart';

late HomeApi _api;

main() async {
  await ConfigUtil.init();
  _api = ApiDi.homeApi;

  _group1();
  print("");
}

_group1() {
  group("Home API Overall Test", () {
    test("_getDashboardDataTest", () async {
      prinw("_getDashboardDataTest ============");
      await _getDashboardDataTest();
      prinw("_getDashboardDataTest ============ end");
    });

    print("");

    test("_getNotifsTest", () async {
      prinw("_getNotifsTest ============");
      await _getNotifsTest();
      prinw("_getNotifsTest ============ end");
    });

    print("");

    test("_getMsgsTest", () async {
      prinw("_getMsgsTest ============");
      await _getMsgsTest();
      prinw("_getMsgsTest ============ end");
    });

    print("");
  });
}

_getDashboardDataTest() async {
  final res = await _api.getDashboardData();
  prinr("res = $res");
  assert(res.code == 200);
}

_getNotifsTest() async {
  final res = await _api.getNotifs();
  prinr("res = $res");
  assert(res.code == 200);
}

_getMsgsTest() async {
  final res = await _api.getMessages();
  prinr("res = $res");
  assert(res.code == 200);
}