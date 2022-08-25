import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class PostDB {

  late Database db;

  initialization() async {
    String databasesPath = await getDatabasesPath();

    String databaseName = 'class1.db';

    String newPath = join(databasesPath, databaseName);

    db =await openDatabase(newPath, version: 2, onCreate: (db, v) {
      db.execute("create table post ( "
          "id integer primary key autoincrement,"
          "name Text)");
  });
  }
  Future<List<Map>> readPosts() async {
    await initialization();
    List<Map> list = await db.rawQuery('SELECT name FROM post');
    return list;
  }

  insertPost(String postName) async {
    await initialization();
    await db.insert('post', {'name':postName});
    db.close();
  }

}