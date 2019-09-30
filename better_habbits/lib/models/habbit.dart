
final String columnId = '_id';
final String columnName = 'name';

class Habbit {

  int id;
  String name;
  String category;

  Habbit();

  Habbit.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}