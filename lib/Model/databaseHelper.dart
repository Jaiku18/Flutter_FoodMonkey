import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class databaseHelper {
  static final _databaseName = 'DB_for_FoodMonkey';
  static final _databaseVersion = 1;
  static final table = 'hotels';
  static final columnId = 'id';
  static final columnhotel_name = 'hotel_name';
  static final columnArea = 'Area';
  static final columnCusine = 'Cusine';
  static final columnTiming = 'Timing';
  static final columnImage = 'Image';
  static final columnAmount = 'Amount';
  static final columnRating = 'Rating';
  static final columnlat = 'lat';
  static final columnlon = 'lon';
  static final columnonlyVeg = 'onlyVeg';

  databaseHelper._privateConstructor();
  static final databaseHelper instance = databaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    var databasePath = await getDatabasesPath();

    String path = join(databasePath, _databaseName);
    print(path);

    var exists = await databaseExists(path);
    print(exists.toString());
    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e.toString());
      }
//copy DB
      ByteData data = await rootBundle.load(join("assets", _databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      // write
      await File(path).writeAsBytes(bytes, flush: true);
      print("copying database");
    } else {
      print("database is opening");
    }
    return await openDatabase(path, version: _databaseVersion);
  }

  Future<List> getHotelsMenu() async {
    Database db = await instance.database;
    var result = await db
        .rawQuery('select hotel_name, Cusine, Amount, Image, id from hotels');
    return result.toList();
  }

  Future<int> getCount() async {
    var db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('select count(*) from hotels'));
  }
}
