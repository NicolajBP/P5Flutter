import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:p5/data/local/entity/bruger_entity.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;


part 'app_db.g.dart'; //Lader os generere en fil

LazyDatabase _openConnection(){ //Open connection da den skal kunne finde stien for os
  return LazyDatabase(() async {

    final dbFolder = await getApplicationDocumentsDirectory(); //Vælger lokalisationen hvor vi installerer databasefilen
    final file = File(path.join(dbFolder.path, 'bruger.sqlite')); //Laver filen, finder stien og tilføjer sql filen
    
    return NativeDatabase(file); //Return for at skabe databasen
  });
}


@DriftDatabase(tables: [Bruger]) //Forbindes til bruger tabellen
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 2; 

// Få listen af brugere
  Future<List<BrugerData>> getBrugers() async {
    return await select(bruger).get(); //Returner liste af brugere
  }
//Finder bestemt bruger ID og returnerer det
  Future<BrugerData>getBruger(int id) async {
    return await (select(bruger)..where((tbl) => tbl.id.equals(id))).getSingle(); //Vi returner en enkelt værdi (Enkelt bruger)
  }

  Future<bool> updateBruger(BrugerCompanion entity) async {
  return await update(bruger).replace(entity); //Updater brugerlisten
}
  Future<int> insertBruger(BrugerCompanion entity) async {
    return await into(bruger).insert(entity); //indsætter entity som vi passer
  }

  Future<int> deleteBruger(int id) async {
    return await (delete(bruger)..where((tbl) => tbl.id.equals(id))).go(); //Finder brugerens id og sletter det. 
  }

}    
