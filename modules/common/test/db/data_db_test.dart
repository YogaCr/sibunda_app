import 'dart:math';

import 'package:common/arch/data/local/db/app_db.dart';
import 'package:common/arch/data/remote/api/data_api.dart';
import 'package:core/util/_consoles.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moor/ffi.dart';

import '../util/common_test_const.dart';

late DataApi _api;
final Faker _faker = Faker();
late AppDatabase _db;

main() async {
  _api = DataApi(await CommonTestConst.getDummySession());

  _group1();
}

_group1() {
  group("Data db Overall Test", () {
    setUp((){
      _db = AppDatabase(VmDatabase.memory(logStatements: true));
    });
    test("Download data and save, then load", () async {
      final resp = await _api.getCity();
      assert(resp.isNotEmpty);

      final randInt = _faker.randomGenerator;
      final len = randInt.integer(resp.length, min: 3);
      final start = randInt.integer(resp.length-len,);
      final end = randInt.integer(resp.length, min: start+len);
      final forLimit = randInt.integer(len);

      prind("len = $len start = $start end = $end forLimit = $forLimit total = ${resp.length}");

      final chunk = resp.sublist(start, end);
      prind("chunk = $chunk");
      final entities = chunk.map((e) => e.toEntityJson()).map((e) => CityEntity.fromJson(e)).toList(growable: false);
      prind("entities = $entities");

      await _db.cityDao.insertAll(entities);

      prind("_db.cityDao.getByName ======");
      for(int i = 0; i < forLimit; i++) {
        final randomData = entities[randInt.integer(len)];
        prind("randomData $i = $randomData");

        final queried = await _db.cityDao.getByName(randomData.name);
        prind("queried $i = $queried");

        assert(queried == randomData);
      }

      print("");
      prind("_db.cityDao.getById ======");
      for(int i = 0; i < forLimit; i++) {
        final randomData = entities[randInt.integer(len)];
        prind("randomData $i = $randomData");

        final queried = await _db.cityDao.getById(randomData.id);
        prind("queried $i = $queried");

        assert(queried == randomData);
      }
    });
    tearDown((){
      _db.close();
    });
  });
}

