import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'data_manager.dart';

class DbGameHandler {
  static const String dbName = 'jogo_assassinato.db';

  static const String tableName = 'tb_suspects';

  static final DbGameHandler instance = DbGameHandler._internal();

  Database? _db;

  DbGameHandler._internal();

  Future<void> initialize() async {
    _db ??= await openDatabase(
      join(await getDatabasesPath(), dbName),
      version: 1,
      onOpen: (db) {
        db.execute('''
            CREATE TABLE IF NOT EXISTS $tableName (
              name TEXT PRIMARY KEY,
              text TEXT
            )
          ''');
      },
    );
  }

  Future<void> dropTable() async {
    await _db!.execute('DROP TABLE IF EXISTS $tableName');
  }

  Future<void> createTable() async {
    await _db!.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        name TEXT PRIMARY KEY,
        text TEXT
      )
    ''');
  }

  Future<int> addSuspect(DadosSuspect suspect) async {
    final Map<String, dynamic> data = {
      'name': suspect.name,
      'text': suspect.text,
    };

    final id = await _db!.insert(tableName, data);
    return id;
  }

  Future<int> updateSuspect(DadosSuspect suspect) async {
    final data = {
      'text': suspect.text,
    };

    final count = await _db!.update(
      tableName,
      data,
      where: 'name = ?',
      whereArgs: [suspect.name],
    );

    return count;
  }

  Future<void> deleteSuspect(String name) async {
    await _db!.delete(
      tableName,
      where: 'name = ?',
      whereArgs: [name],
    );
  }

  Future<List<DadosSuspect>> getAllSuspects() async {
    final db = _db;
    if (db == null) {
      throw Exception('Database is not initialized. Call initialize() first.');
    }
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return maps.map((data) => DadosSuspect.fromMap(data)).toList();
  }

  Future<void> close() async {
    await _db?.close();
    _db = null;
  }
}
