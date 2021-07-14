import 'dart:io';

import 'package:common/value/db_const.dart';
import 'package:core/util/_consoles.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';

import 'package:path_provider/path_provider.dart' as paths;
import 'package:path/path.dart' as p;

import '../app_db.dart';

AppDatabase constructDb({bool logStatements = false}) {
  if (Platform.isIOS || Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, DbConst.DB_FILE));
      return VmDatabase(dbFile, logStatements: logStatements);
    });
    return AppDatabase(executor);
  }
  if (Platform.isMacOS || Platform.isLinux || Platform.isWindows) {
    final file = File(DbConst.DB_FILE);
    return AppDatabase(VmDatabase(file, logStatements: logStatements));
  }
  // if (Platform.isWindows) {
  //   final file = File('db.sqlite');
  //   return Database(VMDatabase(file, logStatements: logStatements));
  // }
  return AppDatabase(VmDatabase.memory(logStatements: logStatements));
}

Future<bool> destroyDb({bool logStatements = false}) async {
  try {
    final dataDir = await paths.getApplicationDocumentsDirectory();
    final dbFile = File(p.join(dataDir.path, DbConst.DB_FILE));
    await dbFile.delete();
    return true;
  } catch(e, stack) {
    prinw("Error calling `destroyDb()`, e= $e");
    prine(stack);
    return false;
  }
}