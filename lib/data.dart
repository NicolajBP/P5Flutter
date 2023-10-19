import "package:drift/drift.dart";

part "data.g.dart"; // Navnet på den fil vi genererer til databasen. Filen gør at vi kan tilgå databasen

class Products extends Table { // Vi laver en tabel
  IntColumn get id => integer().autoIncrement()(); // Laver et ID som automatisk inkrementeres
  TextColumn get title => text()(); // Laver en titel af typen "text"
  TextColumn get description => text()(); // => betyder description "of type" text
}


abstract class ProductsView extends View {
  Products get products;

  @override // Vi laver en query for at få titlen fra en instans af vores table
  Query as() => select([
    products.title
  ]).from(products);
}

@DriftDatabase(tables:[ // Vi fortæller Flutter hvilke ting der skal være i databasen
  Products //, NyTabel, EndnuEnTabel (Hvis vi har flere tabeller)
], views: [
  ProductsView //, NyView (der kan være flere views)
])

class Database extends _$Database { // _ betyder at det er private
  Database(QueryExecutor e): super(e);

  @override
  int get schemaVersion => 2; // Bruges til at holde styr på hvilken version af databasen vi tilgår
}






















