import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper{
  static final dataBaseName = "pharmacy.db";
  static const version = 1;
  static final TableName ='Ahmed';
  static const id = 'ID';
  static const String Name = 'Name';
  static final BarCode = 'BarCode';
  static const Cost = 'Cost';
  static const Sell = 'Sell';
  static const _dose = 'dose';
  static const _mostSide = 'mostSide';
  static const _drugName = 'drugName';
  static const _mechanism = 'mechanism';
  static const _pregnancy = 'pregnancy';
  // dose,mostSide,drugName,mechanism,pregnancy;
 DataBaseHelper._privateConstructor();
static DataBaseHelper dataBaseHelper = DataBaseHelper._privateConstructor();
  static Database? _database;

Future<Database?> get database async{
  if(_database != null) {
    return _database;
  } else {
    return await _initDataBase();
  }
}

  _initDataBase() async {
  var datPath = await getDatabasesPath();
  String path = join(datPath,dataBaseName);
  if(!await databaseExists(path)){
    try{
      await Directory(dirname(path)).create(recursive: true);
    }catch(e){
      print(e);
    }
    ByteData data = await rootBundle.load(join("assets",dataBaseName));

    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);

    await File(path).writeAsBytes(bytes);
  }else{
    print("opening data");
  }
  return await openDatabase(path,version: version);
  }


  //insert
Future<int?> insert (String sql) async {
  Database? db = await database;
  return await db?.rawInsert(sql);
}

//SelectAll
Future<List<Map<String, Object?>>?> getAllUser() async {
  Database? db = await dataBaseHelper.database;
  var result = await db?.query(TableName);
  db!.close();
  return result?.toList();
}
readData(String sql) async {
  Database? db = await database;
  List<Map> response = await db!.rawQuery(sql);
  return response;
}



// counts
// Future<int?> getCount() async{
//   var db = await dataBaseHelper.database;
//   return Sqflite.firstIntValue(await db?.rawQuery('SELECT COUNT(ID) FROM $TableName'));
// }
//update
//   Future<int> upDate (Map<String,dynamic> row) async {
//
//     String id = row[Name];
//     return await db.update(TableName, row,where: Name,whereArgs: [id]);
//   }
  // Future<List<Map>> Data() async {
  //   Database? db = await dataBaseHelper.database;
  //   List<Map> response =await db?.readData("SELECT * FROM Ahmed");
  //   return response;
  // }
  //delete
  // Future<int> delete (String id) async {
  //   Database db = await dataBaseHelper.database;
  //   return await db.delete(TableName,where: Name,whereArgs: [id]);
  // }

}