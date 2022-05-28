import '/models/note.dart';
import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';

class DBHelper with ChangeNotifier {
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();

  static final String notetitleColumn = "notetitle";
  static final String noteDescriptionColumn = 'notedescription';

  Future<Database> initDataBase() async {
    Database database = await connectToDatabase();
    return database;
  }

  Future<Database> connectToDatabase() async {
    Directory appfolder = await getApplicationDocumentsDirectory();
    String appPath = appfolder.path;
    String dbPath = join(appPath, "enasss.db");
    Database database = await openDatabase(dbPath, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, $notetitleColumn TEXT, $noteDescriptionColumn TEXT )');
    }, onOpen: (database) {
      print(database.path);
    }, version: 1);
    return database;
  }

  insertNewNote(Note note) async {
    Database db = await initDataBase();
    int rowNo = await db.insert("note", note.toMap());
    print(rowNo);
    notifyListeners();
  }

  Future<List<Note>> getAllNote() async {
    Database db = await initDataBase();
    List result = await db.query("note");
    List<Note> notes = result.map((e) {
      return Note.fromMapObject(e);
    }).toList();
    notifyListeners();
    return notes;
  }

  List<Note> allNotes = [];
  List<Note> notes = [];
  getAllTasks() async {
    notes = await getAllNote();
    allNotes = notes;

    notifyListeners();
    return notes;
  }

  deleteNote(int id) async {
    Database db = await initDataBase();
    db.delete("note", where: "id=?", whereArgs: [id]);
    notifyListeners();
  }

  updateNote(
    Note note,
  ) async {
    try {
      Database db = await initDataBase();
      db.update("note", note.toMap(), where: "id:?", whereArgs: [note.id]);
    } on Exception catch (e) {
      print("error");
    }
  }
}
