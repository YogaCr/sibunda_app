import 'package:core/util/_consoles.dart';

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