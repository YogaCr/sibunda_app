main() {
  final d = 1.000000000000001;
  final i = d.toInt();

  print(d == i);

  print(a(10));
  print(a(9, false));
}




int a(int i, [bool isPlus = true]) {
  int b() => i + 1;
  int c() => i - 1;
  return isPlus ? b() : c();
}