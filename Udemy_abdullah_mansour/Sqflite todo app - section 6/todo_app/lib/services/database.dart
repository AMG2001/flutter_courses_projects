import 'package:sqflite/sqflite.dart';

class Database {
  static String _databasename = "todo.db";
  static void createDatabase() async {
    /**
     * 
     */
    var database = await openDatabase(
      _databasename,
      /**
     * it's our first time to create DB without any editings so we will give it version : 1
     */
      version: 1,
      /**
         * onCreate() -> method called first time only .
         */
      onCreate: ((db, version) async {
        print("database created #");
        /**
           * create table , and because we create it only 1 time , so we added it in onCreate() .
           */
        await db
            .execute(
                "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTO_INCREMENT , title TEXT ,date TEXT,time TEXT , status TEXT)")
            .then((value) => print("table Created Successfully # "))
            .onError((error, stackTrace) => print(error));
      }),
      onOpen: (db) {
        print("Database opened");
      },
    );
  }
}
