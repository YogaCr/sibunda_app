
Iterable<T> distinct<T>(Iterable<T> itr, { dynamic Function(T)? selector }) {
  final set = <dynamic>{};
  if(selector == null) {
    return itr.where((e) => set.add(e));
  } else {
    return itr.where((e) => set.add(selector(e)));
  }
}

List<T> distinctList<T>(Iterable<T> itr, {
  dynamic Function(T)? selector,
  bool growable = false,
}) => distinct(itr, selector: selector).toList(growable: growable);

