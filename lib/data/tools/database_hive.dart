import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:reminder/models/activity_model.dart';

class DBService{
  static const String dbName = "db_notes";
  static Box box = Hive.box(dbName);

  static Future<void> storeMode(bool isLight) async {
    await box.put("isLight", isLight);
  }

  static bool loadMode() {
    return box.get("isLight", defaultValue: true);
  }

  static Future<void> storeNotes(List<Notes> noteList) async {
    // object => map => String
    List<String> stringList = noteList.map((note) => jsonEncode(note.toJson())).toList();
    await box.put("notes", stringList);
  }

  static List<Notes> loadNotes() {
    // String =>  Map => Object
    List<String> stringList = box.get("notes") ?? <String>[];
    List<Notes> noteList = stringList.map((string) => Notes.fromJson(jsonDecode(string))).toList();
    return noteList;
  }

  static Future<void> removeNotes() async {
    await box.delete("notes");
  }
}