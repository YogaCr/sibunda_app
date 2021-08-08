import 'package:common/arch/di/db_di.dart';
import 'package:core/util/_consoles.dart';
import 'package:moor/moor_web.dart';

import '../app_db.dart';

AppDatabase constructDb({bool logStatements = false}) {
  return AppDatabase(WebDatabase('db', logStatements: logStatements));
}

Future<bool> destroyDb({bool logStatements = false}) async {
  try {
    //await constructDb(logStatements: logStatements).dropAllTable();
    return await DbDi.obj.db.dropAllTable();
  } catch(e, stack) {
    prine(stack);
    return false;
  }
}
