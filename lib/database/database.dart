import 'dart:io';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
part 'database.g.dart';

class Posteo extends Table {
  TextColumn get sourceName => text().named('sourceName')();
  TextColumn get author => text().named('author')();
  TextColumn get title => text().named('title')();
  TextColumn get description => text().named('description')();
  TextColumn get url => text().named('url')();
  TextColumn get urlToImage => text().named('urlToImage')();
  TextColumn get publishedAt => text().named('publishedAt')();
  TextColumn get content => text().named('content')();
}

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory(); //obtener la ruta de donde va a ser guardada la base de datos
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Posteo])
class AppDatabase extends _$AppDatabase {
  AppDatabase(NativeDatabase nativeDatabase) : super(openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertNew(PosteoCompanion postCompani) async {
    return into(posteo).insert(postCompani);
  }

  Future<List<PosteoData>> getAllNews() async {
    return select(posteo).get();
  }

  Future<int> updateNew(PosteoCompanion postCompanion) async {
    return (update(posteo)..where((tbl) => tbl.sourceName.equals(postCompanion.sourceName.value))).write(postCompanion);
  }

  Future<int> deleteNew(PosteoData posteoData) async {
    return (delete(posteo)..where((tbl) => tbl.title.equals(posteoData.title))).go();
  }
}