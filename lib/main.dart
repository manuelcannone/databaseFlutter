import 'package:flutter/material.dart';
import 'models.dart' as db; 
import 'package:sqflite/sqflite.dart';
void main() async{

 
  runApp(MyApp());
  
 
  // var result = await database.rawQuery("SELECT * FROM users;");
  // print(result);
}



class MyApp extends StatefulWidget {

   MyApp({ Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home :Scaffold(
        body: Center(
          child: Container(
      child: ElevatedButton(
        child: Text("Add"),
        onPressed: () async {
        
          db.SQLHelper.newItem();
              
      }),
    ),
        ),
      )
    );
  }
}