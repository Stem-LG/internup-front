List<T> insertInbetween<T>({required List<T> list, required T insert}) {
  List<T> res = [];

  for (int i = 0; i < list.length; i++) {
    res.add(list[i]);
    if (i != list.length - 1) {
      res.add(insert);
    }
  }

  return res;
}