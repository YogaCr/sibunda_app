
import 'package:common/arch/data/remote/api/data_api.dart';
import 'package:core/util/_consoles.dart';
import 'package:flutter_test/flutter_test.dart';

import '../util/common_test_const.dart';

late DataApi _api;

main() async {
  _api = DataApi(await CommonTestConst.getDummySession());

  _group1();
  print("");
}

_group1() {
  prinw("Data Overall Test ===========");
  group("Data Overall Test", () {
    test("_getCity", () async {
      prinw("_getCity ===========");
      await _getCity();
      prinw("_getCity =========== end");
    });

    print("");

    test("_getBio", () async {
      prinw("_getBio ===========");
      await _getBio();
      prinw("_getBio =========== end");
    });

    print("");
  });
  prinw("Data Overall Test =========== end");
}


_getCity() async {
  final res = await _api.getCity();
  prinr("res = $res");
  assert(res.isNotEmpty);
}

_getBio() async {
  final res = await _api.getBio();
  prinr("res = $res");
  assert(res.code == 200);
}