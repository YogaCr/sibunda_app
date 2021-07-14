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

  final sw = Stopwatch();

  sw.start();
  await Future.delayed(Duration(milliseconds: 1000), () {
    prinw("Future.delayed duration = 1000");
    prind("sw.elapsed = ${sw.elapsed}");
  });
  await Future.delayed(Duration(milliseconds: 300), () {
    prinw("Future.delayed duration = 300");
    prind("sw.elapsed = ${sw.elapsed}");
  });

  //true & false;
  var a = false;
  //if(a &&= true){}
  var b = true;
  b &= false;
  prin("b = $b");
  b |= true;
  prin("b = $b");
  b &= true & false;
  prin("b = $b");
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