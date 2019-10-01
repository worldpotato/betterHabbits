import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:better_habbits/models/habbit.dart';

final String tableHabbits = 'habbits';
final String columnId = '_id';
final String columnName = 'name';
final String columnCategory = "category";

class DatabaseHelper {

  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "betterHabbits.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1; // when updating the version also create a upgrade function! For Prototyp, just unistall the app

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate
        /*onUpgrade: _onDatabaseUpgrade*/);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableHabbits (
                $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
                $columnName TEXT NOT NULL,
                $columnCategory TEXT                
              )
              ''');
  }

  // Database helper methods:

  Future<int> insert(Habbit habbit) async {
    Database db = await database;
    int id;
    try{
      id = await db.insert(tableHabbits, habbit.toMapForDb());
    } on DatabaseException catch (e) {
      print(e.toString());
    }
    return id;
  }

  Future<Habbit> queryHabbit(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableHabbits,
        columns: [columnId, columnName],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      print(Habbit.fromMap(maps.first));
      return Habbit.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Habbit>> queryAllHabbits() async {
    Database db = await database;
    List<Habbit> habbits = [];
    List<Map> maps = await db.query(tableHabbits);
    if (maps.length > 0) {
      for(Map map in maps) {
        habbits.add(Habbit.fromMap(map));
      }
      return habbits;
    }
    return null;
  }

  /* This function is for the case that the current database has a older version
  * With introducing a new database version it is necessary to create a
  * Database upgrade function from the older version to the next version.
  *
  * To make sure that the migration from a very old version to the current
  * current version is possible we can use the switch case without breaks.
   */
//  _onDatabaseUpgrade(db, oldVersion, newVersion) {
//
//    print("Upgrade Database");
//    switch(oldVersion){
//      case 1:
//        _upgradeFromV1toV2(db);
//        continue v2;
//        v2:
//      case 2:
//    }
//  }

//  _upgradeFromV1toV2(db){
//    db.execute('''
//    ALTER TABLE $tableHabbits
//    ADD $columnCategory TEXT;
//    ''');
//  }

// TODO: delete(int id)
// TODO: update(Word word)
}