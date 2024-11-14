import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:server_grpc/database/models/data_model.dart';
import 'package:server_grpc/logger/logger_printer.dart';
import 'package:sqflite/sqflite.dart';

import '../data/db_table_repo.dart';

class DbServices {
  static final logger = getLogger(DbServices);
  static final DbServices _instance = DbServices._internal();
  factory DbServices() => _instance;
  DbServices._internal();

  static Database? _database;

  static Future<Database> get dataBase async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  static Future _config(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static Future initDB() async {
    Directory docuemnts = await getApplicationCacheDirectory();
    final path = join(docuemnts.path, 'prueba.db');
    return await openDatabase(
      path,
      version: 3,
      onConfigure: _config,
      onCreate: (db, version) async {
      
        await db.execute(
            '''
        CREATE TABLE  IF NOT EXISTS Transactions(
          idProto TEXT PRIMARY KEY,
          status TEXT,
          type TEXT,
          referenceNumber TEXT,
          arqc TEXT,
          maskPan TEXT,
          amount TEXT,
          authorizationNumber TEXT,
          stan TEXT,
          resultCode TEXT,
          secondaryAmount TEXT
          )
        ''');
          await db.execute(
          '''
            CREATE TABLE  IF NOT EXISTS  AdditionalInformation(
            idDetail INTEGER PRIMARY KEY AUTOINCREMENT,
            entryMode TEXT,
            cardBrand TEXT,
            transactionDate TEXT,
            isFallback Boolean,
            onlineRequested Boolean,
            cvmType TEXT,
            idProto,
            FOREIGN KEY(idProto) REFERENCES Transactions(idProto)   ON DELETE CASCADE
            )
          '''
          );
        await db.execute(
            '''
        CREATE TABLE  IF NOT EXISTS  Origintransaction(
            origintransactionId INTEGER PRIMARY KEY AUTOINCREMENT,
            origin TEXT,
            idProto TEXT)
          '''
          //  FOREIGN KEY(idProto) REFERENCES Transactions(idProto) ON DELETE CASCADE
          );
    
        await db.execute(
            '''
        CREATE TABLE  IF NOT EXISTS  ResultTransaction(
            idProto Text,
            dataResult TEXT)
          '''
          );
           await db.execute(
          '''
            CREATE TABLE  IF NOT EXISTS  WaitingTransaction(
            idProto Text,
            isCancel Boolean)
          '''
          );

          
      },
    );
  }

  static Future<int> insert(NameTable table, DataDbM data) async {
    final db = await dataBase;
    try {
      return await db.insert(table.value, data.toMap());
    } catch (e) {
      logger.e(e);
      return 0;
    }
  }


  static Future<List<Map<String, dynamic>>> getAll(NameTable table) async {
    final db = await dataBase;
    final resp = await db.query(table.value);
    return resp;
  }

  static Future<int> delete(NameTable table, int id) async {
    final db = await dataBase;
    return await db.delete(table.value);
  }

  static Future<int> update(NameTable table, {required DataDbM data, SearchBy type = SearchBy.idProto, required String value}) async {
    final db = await dataBase;
    try {
      return await db.update(table.value, data.toMap(),
          where: '${type.value} =? ', whereArgs: [value]);
    } catch (e) {
      logger.e(e);

      return 0;
    }
  }

  static Future<List<Map<String, dynamic>>> customQuery(String query) async {
    final db = await dataBase;
   try {
     return await db.rawQuery(query);
   } catch (e) {
     return [];
   }
 
  }
    static Future<List<Map<String, dynamic>>> getBy(NameTable table, {required SearchBy idSear, required String id }) async {
    final db = await dataBase;
   try {
     return await db.query(table.value, where: '${idSear.value} = ?', whereArgs: [id]);
   } catch (e) {
     return [];
   }
 
  }


  static Future<int> updateStatus(NameTable table,{required Map<String, dynamic> data,required String idTransaccion}) async {
    final db = await dataBase;
    try {
      return await db.update(table.value, data, where: '${SearchBy.idProto.value} =? ', whereArgs: [idTransaccion]);
    } catch (e) {
      logger.e(e);
      return 0;
    }
  }
  
    static Future<List<Map<String, dynamic>>> getByOriginId({required String origin, required String idTransaccion}) async {
    final db = await dataBase;
    try {
       final resp =  await db.rawQuery(
        '''SELECT * FROM Transactions 
          where idProto == '$idTransaccion'
          ''',
        );
      logger.f(resp);
      return resp;
    } catch (e) {
      logger.f(e);
      return [];
    }
  }

static Future<bool> cleanResult(NameTable table) async {
    final db = await dataBase;
    try {
     await db.rawQuery('DELETE FROM ${table.value}');
    return true;
    } catch (e) {
    return false;
    }
  }
  
}

enum SearchBy {
//  transactionId("transactionId"),
  idProto("idProto"),

  origin("origin"),
  origintransactionId("origintransactionId"),
  transactionStatus("transactionStatus"),
  idDetail("idDetail");


  final String value;
  const SearchBy(this.value);
}
