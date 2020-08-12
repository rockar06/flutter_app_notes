import 'package:flutter/material.dart';
import 'package:flutter_notes_app/model/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabaseHelper extends ChangeNotifier {
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _openDatabase();
    return _database;
  }

  Future<Database> _openDatabase() async {
    final Future<Database> database = openDatabase(
      await _getDatabasePath(),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE notes(id TEXT PRIMARY KEY NOT NULL,'
          ' title TEXT,'
          ' note TEXT,'
          ' timestampEdition TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }

  Future<String> _getDatabasePath() async {
    return join(await getDatabasesPath(), 'notes_database.db');
  }

  insertNote(Note noteToSave) async {
    final db = await database;
    await db.insert(
      'notes',
      noteToSave.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }

  updateNote(Note noteToUpdate) async {
    final db = await database;
    await db.update(
      'notes',
      noteToUpdate.toMap(),
      where: 'id = ?',
      whereArgs: [noteToUpdate.id],
    );
    notifyListeners();
  }

  Future<List<Note>> getAllNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes');
    return List.generate(
      maps.length,
      (index) {
        return Note(
          maps[index]['id'],
          maps[index]['title'],
          maps[index]['note'],
          maps[index]['timestampEdition'],
        );
      },
    );
  }

  deleteNoteWithId(String id) async {
    final db = await database;
    db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
    notifyListeners();
  }

  Future<List<Note>> searchForNotes(String queryString) async {
    print('Searching text: $queryString');
    final db = await database;
    final List<Map<String, dynamic>> maps = await db
        .rawQuery('SELECT * FROM notes WHERE title LIKE \'%$queryString%\' '
            'UNION '
            'SELECT * FROM notes WHERE note LIKE \'%$queryString%\'');
    return List.generate(
      maps.length,
      (index) {
        return Note(
          maps[index]['id'],
          maps[index]['title'],
          maps[index]['note'],
          maps[index]['timestampEdition'],
        );
      },
    );
  }
}
