import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? _db;
  static int itemsMyRecorings = 0;

  static const String myRecordingTableName = "MyRecordings";
  static const String myCallsTableName = "MyRecordings";

  static String tableMyRecordings =
      "CREATE TABLE IF NOT EXISTS MyRecordings(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, createdAt TEXT, isFavourite INTEGER, path TEXT)";
  static String tableMyCalls =
      "CREATE TABLE IF NOT EXISTS MyCalls(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, createdAt TEXT, isFavourite INTEGER, path TEXT)";

  static Future<Database?> dbConnection() async {
    _db = await openDatabase(
        join(
          await getDatabasesPath(),
          "call_recordings_database.db",
        ), onCreate: ((db, version) async {
      await db.execute(tableMyRecordings);
      await db.execute(tableMyCalls);
    }), version: 1);

    return _db;
  }

  static Future<void> insertMyRecording(Map<String, Object> data) async {
    Database db = await DbHelper.dbConnection() as Database;
    await db.insert(myRecordingTableName, data).whenComplete(() {
      // print(data.toString());
    });
  }

  static Future<List<Map<String, Object?>>> getMyRecordings() async {
    Database db = await DbHelper.dbConnection() as Database;
    return await db.query(
      myRecordingTableName,
      orderBy: "id DESC",
    );
  }

  // static Future<bool> deleteTable() async {
  //   bool com = false;
  //   Database db = await DbHelper.dbConnection() as Database;
  //   await db
  //       .execute("DROP TABLE IF EXISTS CartItems")
  //       .whenComplete(() => com = true);
  //   print("Table Deleted");
  //   await db.execute(tbc);
  //   print("Table created");
  //   return com;
  // }

  // static Future<bool> incrimentItemPrice(
  //     String id, int quantity, String total) async {
  //   String query =
  //       "UPDATE CartItems SET quantity=$quantity , total=$total WHERE id=$id";
  //   bool isDone = false;
  //   Database db = await DbHelper.dbConnection() as Database;
  //   await db.rawUpdate(query).whenComplete(() {
  //     isDone = true;
  //   });
  //   return isDone;
  // }

  static Future<bool> deleteVoice(
      {required String tableName, required String id}) async {
    String query = "DELETE FROM $tableName WHERE id=$id";
    bool isDone = false;
    Database db = await DbHelper.dbConnection() as Database;
    await db.rawDelete(query).whenComplete(() {
      isDone = true;
    });
    return isDone;
  }

  static Future<bool> toggleFavVoice(
      {required String tableName,
      required String id,
      required bool val}) async {
    String isFav = val ? "1" : "0";
   
    String query = "UPDATE $tableName SET isFavourite = $isFav WHERE id=$id";

    bool isDone = false;
    Database db = await DbHelper.dbConnection() as Database;
    await db.execute(query);
    return isDone;
  }

  static Future<int> countVoices(String tableName) async {
    String query = "SELECT COUNT (*) from $tableName";
    try {
      Database db = await DbHelper.dbConnection() as Database;
      var x = await db.rawQuery(query);
      int? count = Sqflite.firstIntValue(x);
      itemsMyRecorings = count!;
    } catch (e) {
      itemsMyRecorings = 0;
    }
    return itemsMyRecorings;
  }
}
