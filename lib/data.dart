import "package:drift/drift.dart";

part "data.g.dart"; // Navnet på den fil vi genererer til databasen. Filen gør at vi kan tilgå databasen. Hvis vi ændrer i vores data.dart fil, skal vi slette data.g.dart og køre koden igen. 
// BRUG KOMMANDOEN dart pub run build_runner build

class Products extends Table { // Vi laver en tabel
  IntColumn get id => integer().autoIncrement()(); // Laver et ID som automatisk inkrementeres
  TextColumn get title => text()(); // Laver en titel af typen "text"
  TextColumn get description => text()(); // => betyder description "of type" text
}

class Details extends Table {
  IntColumn get id => integer().autoIncrement()(); // Laver et ID som automatisk inkrementeres
  TextColumn get name => text()(); // Laver et navn af typen "text"
  IntColumn get productId => integer().references(Products, #id)(); // Her bruger vi "Joins" konceptet --> vi får productId fra Products-tabellen, i id-rækken (det er altså samme ID)
}

abstract class ProductsView extends View {
  Products get products;
  Details get details;

  @override // Vi laver en query for at få titlen fra en instans af vores table
  Query as() => select([
    products.title, details.name
  ]).from(products).join([innerJoin(details, details.productId.equalsExp(products.id))]);
}

@DriftDatabase(tables:[ // Vi fortæller Flutter hvilke ting der skal være i databasen
  Products, Details //, NyTabel, EndnuEnTabel (Hvis vi har flere tabeller)
], views: [
  ProductsView //, NyView (der kan være flere views)
])

class Database extends _$Database { // _ betyder at det er private
  Database(QueryExecutor e): super(e);

  @override
  int get schemaVersion => 2; // Bruges til at holde styr på hvilken version af databasen vi tilgår
}






















