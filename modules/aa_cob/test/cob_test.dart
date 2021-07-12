import 'dart:io';

import 'package:core/domain/model/range.dart';
import 'package:core/util/_consoles.dart';

main() async {
  final dir = Directory.current;
  print("dir = $dir");

  final file = await File("test.txt").writeAsString("halo bro");
  print("file = $file");
  final str = file.readAsStringSync();
  print("str = $str");

  for(final i in range(10, start: 8)) {
    prind("for i = $i");
  }
}

/*
main(){
  prine("This is error");
  prind("This is debug");
  prinr("This is result");
  prinw("This is warning");
  prinp("This is prinp");

  final list = [1,2,3];
  final list2 = list.map((e) => e * 2).toList(growable: false);
  print(list);
  print(list2);

  list2[1] = 10;
  print(list2);
}
 */