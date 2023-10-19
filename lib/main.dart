
import "package:drift/native.dart";
import "data.dart";

Future<void> main() async {

  final db = Database(NativeDatabase.memory()); // Her siger vi at vores database db er lig klassen "Database" fra data.dart

  final id = await db.into(db.products).insert(ProductsCompanion.insert(
    title: "Flutter Drift", 
    description: "Drift Database")); //DatabaseCompanion tillader os at indsætte data i vores database. Den spørger kun og title og description da "id" bruger metoden autoIncrement() og derfor deklareres automatisk

  await db.into(db.details).insert(DetailsCompanion.insert(name: "Database name", productId: id));

  await db.into(db.products).insert(ProductsCompanion.insert(
    title: "FTutorial on Database", 
    description: "Tutorial on Database")); 
  // ignore: avoid_print
  (await db.select(db.products).get()).forEach(print); // Vi finder db.products i data.g.dart --> databasen er blevet genereret her. Linjen printer hvad der står i databasen
  (await db.select(db.details).get()).forEach(print);
  (await db.select(db.productsView).get()).forEach(print); // Printer en kombination af info fra details og products, da de nu er blevet joinet
}
