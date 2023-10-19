import 'package:drift/drift.dart';

class Bruger extends Table {
  IntColumn get id => integer().autoIncrement()(); //AutoIncrement bliver primary key og autoIncrement. idk den bedste forklaring han gav.
  TextColumn get username => text().named('email')(); //Username er sat til email
  TextColumn get firstName => text().named('first_name')(); //fornavn
  TextColumn get lastName => text().named('last_name')(); //Efternavn
  DateTimeColumn get dateOfBirth => dateTime().named('date_of_birth')(); //Føds' dag
}