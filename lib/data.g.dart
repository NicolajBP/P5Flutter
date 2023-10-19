// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int id;
  final String title;
  final String description;
  const Product(
      {required this.id, required this.title, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      id: Value(id),
      title: Value(title),
      description: Value(description),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
    };
  }

  Product copyWith({int? id, String? title, String? description}) => Product(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> description;
  const ProductsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String description,
  })  : title = Value(title),
        description = Value(description);
  static Insertable<Product> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<String>? description}) {
    return ProductsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class ProductsViewData extends DataClass {
  final String title;
  const ProductsViewData({required this.title});
  factory ProductsViewData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductsViewData(
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
    };
  }

  ProductsViewData copyWith({String? title}) => ProductsViewData(
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('ProductsViewData(')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => title.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsViewData && other.title == this.title);
}

class $ProductsViewView extends ViewInfo<$ProductsViewView, ProductsViewData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$Database attachedDatabase;
  $ProductsViewView(this.attachedDatabase, [this._alias]);
  $ProductsTable get products => attachedDatabase.products.createAlias('t0');
  @override
  List<GeneratedColumn> get $columns => [title];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'products_view';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $ProductsViewView get asDslTable => this;
  @override
  ProductsViewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductsViewData(
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      generatedAs: GeneratedAs(products.title, false),
      type: DriftSqlType.string);
  @override
  $ProductsViewView createAlias(String alias) {
    return $ProductsViewView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(products)..addColumns($columns));
  @override
  Set<String> get readTables => const {'products'};
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $ProductsTable products = $ProductsTable(this);
  late final $ProductsViewView productsView = $ProductsViewView(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [products, productsView];
}
