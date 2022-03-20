import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';



class SQLHelper{


 static createDb() async {

  //Prendere il percorso di locazione del database
  String dbSystemPath = await getDatabasesPath();
  // uniamo al percorso il nome del nostro NUOVO database
  String myDbPath = join(dbSystemPath , "instagram.db");

  print(myDbPath);

  Database database = await openDatabase(myDbPath, version: 1, onCreate: tableCreation );
  return  database;

  }
     // popoliamo il database
  static void tableCreation(Database db, int version) async {
    
    await db.execute(
    """
      CREATE TABLE users(
      userID INTEGER PRIMARY KEY ,
      nome CHAR(255) NOT NULL,
      bio CHAR(255) NULL
      );
    """
  );


  
  }

   // create new item 
   static void newItem() async {

    final db = await SQLHelper.createDb();
    db.rawInsert("INSERT INTO users(nome, bio) VALUES('Manuel', 'Sugnu u re di jready');");
    var result = db.rawQuery("SELECT * FROM users");
    print(await result);
  }


}
