
import 'package:core/domain/model/range.dart';

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

/// If [newSize] > [list.length], then [list] will be add new elements with nulls.
/// If [newSize] < [list.length], then [list]'s elements in tail will be removed.
/// If [newSize] = [list.length], then nothing happens.
void setListSize<T>(List<T?> list, int newSize) {
  if(newSize > list.length) {
    for(final i in range(newSize - list.length)){
      list.add(null);
    }
  } else if(newSize < list.length) {
    for(final i in range(list.length - newSize)){
      list.removeLast();
    }
  }
}