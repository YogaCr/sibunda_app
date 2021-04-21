
int parseColor3(String rgb) => _parseColor(rgb, 3) + 0xFF000000;
int parseColor4(String argb) => _parseColor(argb, 4);
int _parseColor(String hex, int length) {
  if(length != 3 && length != 4) throw "Argument `length` must be either 4 or 3.";
  String _rgb = hex;
  if(_rgb.startsWith("#"))
    _rgb = _rgb.substring(1);
  if(_rgb.length != length * 2)
    switch(length){
      case 3: throw "parseColor$length() argument must be RRGGBB with/without # prefix. Current argument = '$hex'";
      case 4: throw "parseColor$length() argument must be AARRGGBB with/without # prefix. Current argument = '$hex'";
    }
  return int.parse(_rgb, radix: 16);
}