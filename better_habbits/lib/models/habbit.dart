import 'package:flutter/cupertino.dart';

final String columnId = '_id';
final String columnName = 'name';
final String columnCategory = "category";

class Habbit {
  num id;
  @required
  String name;
  String category;

  Habbit({this.name, this.category});

  Habbit.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
  }

  Map<String, dynamic> toMapForDb() {
    var map = Map<String, dynamic>();

    map[columnName] = name;
    map[columnCategory] = category;

    return map;
  }
}
