import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' ;

class Sql {
  Database ? database ;

  get dB async {
    return database ?? (database = await intialDb())  ;
  }

  Future intialDb() async {
      String databasepath = await getDatabasesPath() ;
      String path = join(databasepath,'andrew.db') ;
      Database mydatabase = await openDatabase(
        version: 1 , 
        path , 
        onCreate: oncreate ,
        onUpgrade: onupgrade ,
      );
      return mydatabase ;
  }
  void onupgrade ( Database db , int oldVersion , int newVersion ) {
      // on upgrade using when changes the version
  }
  void oncreate ( Database db , int version ) async {
      await db.execute('''
        CREATE TABLE NOTES ( "ID" INTEGER NOT NULL PRIMARY KEY , "NOTES_TILTTLES" TEXT NOT NULL 
        , "NOTES_CONTENT" TEXT NOT NULL , "data" TEXT NOT NULL )   
      ''') ;
  }
  readData( String sql ) async {
    Database ? mydb = await dB ;
    List<Map<String, Object?>>  response  = await mydb!.rawQuery(sql) ;
    return response ;
  }
  insertData ( String sql ) async { 
    Database ? mydb = await dB ;
    int response = await mydb!.rawInsert(sql) ;
    return response ;
  }
  updateData ( String sql ) async { 
    Database ? mydb = await dB ;
    int response = await mydb!.rawUpdate(sql) ;
    return response ;
  }
  deleteData ( String sql ) async { 
    Database ? mydb = await dB ;
    int response = await mydb!.rawDelete(sql) ;
    return response ;
  }
}
