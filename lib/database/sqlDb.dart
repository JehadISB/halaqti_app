import 'package:flutter/gestures.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb{

  static Database? _db;

  Future<Database?> get db async{
    if(_db==null) {
      _db = await initialDb();
    return _db;
    }else
      {
        return _db;
      }
  }

  initialDb()async{
    String databasePath=await getDatabasesPath();
    String path=join(databasePath,"halaqti.db");
    Database myDb= await openDatabase(path,onCreate: _onCreate,version: 1,onUpgrade: _onUpgrade);
    return myDb;
  }

  _onCreate(Database database,int version) async{
    await database.execute('''
      CREATE TABLE masjid (
        m_id INTEGER PRIMARY KEY AUTOINCREMENT,
        masjid_name TEXT NOT NULL,
        location TEXT
      )
    ''');
    await database.execute("""
     CREATE TABLE teacher (
        t_id INTEGER PRIMARY KEY AUTOINCREMENT,
        teacher_name TEXT NOT NULL,
        phone TEXT
      )
    """);
    await database.execute("""
    CREATE TABLE halaqa (
        h_id INTEGER PRIMARY KEY AUTOINCREMENT,
        halaqa_name TEXT NOT NULL,
        teacher_id INTEGER,
        masjid_id INTEGER,
        FOREIGN KEY (teacher_id) REFERENCES teacher(t_id) ON DELETE SET NULL
        FOREIGN KEY (masjid_id) REFERENCES masjid(m_id) ON DELETE SET NULL
      )
    """);
   await database.execute("""
   CREATE TABLE student (
        stu_id INTEGER PRIMARY KEY AUTOINCREMENT,
        student_name TEXT NOT NULL,
        education_level Text,
        age INTEGER,
        father_phone TEXT,
        home_phone TEXT,
        part_count INTEGER,
        registration_year INTEGER,
        halaqa_id INTEGER,
        FOREIGN KEY (halaqa_id) REFERENCES halaqa(h_id) ON DELETE SET NULL
      )
    """);
     print("✅ Database and tables created successfully");
  }

  Future<void> _onUpgrade(Database database, int oldVersion, int newVersion) async {
    print("✅✅ Database upgraded");
  }

  readData(String sql) async {
    Database? database=await db;
    List<Map> data= await database!.rawQuery(sql);
    return data;
  }
  insertData(String sql) async {
    Database? database=await db;
   int data= await database!.rawInsert(sql);
    print("Added");
    return data;
  }
  deleteData(String sql) async {
    Database? database=await db;
    int data= await database!.rawDelete(sql);
    print("Deleted");
    return data;
  }
  updateData(String sql) async {
    Database? database=await db;
    int data= await database!.rawUpdate(sql);
    print("Updated");
    return data;
  }
}