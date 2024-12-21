// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class PosteoData extends DataClass implements Insertable<PosteoData> {
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  PosteoData(
      {required this.sourceName,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});
  factory PosteoData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PosteoData(
      sourceName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sourceName'])!,
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      urlToImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}urlToImage'])!,
      publishedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}publishedAt'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['sourceName'] = Variable<String>(sourceName);
    map['author'] = Variable<String>(author);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['url'] = Variable<String>(url);
    map['urlToImage'] = Variable<String>(urlToImage);
    map['publishedAt'] = Variable<String>(publishedAt);
    map['content'] = Variable<String>(content);
    return map;
  }

  PosteoCompanion toCompanion(bool nullToAbsent) {
    return PosteoCompanion(
      sourceName: Value(sourceName),
      author: Value(author),
      title: Value(title),
      description: Value(description),
      url: Value(url),
      urlToImage: Value(urlToImage),
      publishedAt: Value(publishedAt),
      content: Value(content),
    );
  }

  factory PosteoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PosteoData(
      sourceName: serializer.fromJson<String>(json['sourceName']),
      author: serializer.fromJson<String>(json['author']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      url: serializer.fromJson<String>(json['url']),
      urlToImage: serializer.fromJson<String>(json['urlToImage']),
      publishedAt: serializer.fromJson<String>(json['publishedAt']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sourceName': serializer.toJson<String>(sourceName),
      'author': serializer.toJson<String>(author),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'url': serializer.toJson<String>(url),
      'urlToImage': serializer.toJson<String>(urlToImage),
      'publishedAt': serializer.toJson<String>(publishedAt),
      'content': serializer.toJson<String>(content),
    };
  }

  PosteoData copyWith(
          {String? sourceName,
          String? author,
          String? title,
          String? description,
          String? url,
          String? urlToImage,
          String? publishedAt,
          String? content}) =>
      PosteoData(
        sourceName: sourceName ?? this.sourceName,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('PosteoData(')
          ..write('sourceName: $sourceName, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(sourceName, author, title, description, url,
      urlToImage, publishedAt, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PosteoData &&
          other.sourceName == this.sourceName &&
          other.author == this.author &&
          other.title == this.title &&
          other.description == this.description &&
          other.url == this.url &&
          other.urlToImage == this.urlToImage &&
          other.publishedAt == this.publishedAt &&
          other.content == this.content);
}

class PosteoCompanion extends UpdateCompanion<PosteoData> {
  final Value<String> sourceName;
  final Value<String> author;
  final Value<String> title;
  final Value<String> description;
  final Value<String> url;
  final Value<String> urlToImage;
  final Value<String> publishedAt;
  final Value<String> content;
  const PosteoCompanion({
    this.sourceName = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.content = const Value.absent(),
  });
  PosteoCompanion.insert({
    required String sourceName,
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
  })  : sourceName = Value(sourceName),
        author = Value(author),
        title = Value(title),
        description = Value(description),
        url = Value(url),
        urlToImage = Value(urlToImage),
        publishedAt = Value(publishedAt),
        content = Value(content);
  static Insertable<PosteoData> custom({
    Expression<String>? sourceName,
    Expression<String>? author,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? url,
    Expression<String>? urlToImage,
    Expression<String>? publishedAt,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (sourceName != null) 'sourceName': sourceName,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
      if (urlToImage != null) 'urlToImage': urlToImage,
      if (publishedAt != null) 'publishedAt': publishedAt,
      if (content != null) 'content': content,
    });
  }

  PosteoCompanion copyWith(
      {Value<String>? sourceName,
      Value<String>? author,
      Value<String>? title,
      Value<String>? description,
      Value<String>? url,
      Value<String>? urlToImage,
      Value<String>? publishedAt,
      Value<String>? content}) {
    return PosteoCompanion(
      sourceName: sourceName ?? this.sourceName,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sourceName.present) {
      map['sourceName'] = Variable<String>(sourceName.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (urlToImage.present) {
      map['urlToImage'] = Variable<String>(urlToImage.value);
    }
    if (publishedAt.present) {
      map['publishedAt'] = Variable<String>(publishedAt.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PosteoCompanion(')
          ..write('sourceName: $sourceName, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $PosteoTable extends Posteo with TableInfo<$PosteoTable, PosteoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PosteoTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _sourceNameMeta = const VerificationMeta('sourceName');
  @override
  late final GeneratedColumn<String?> sourceName = GeneratedColumn<String?>(
      'sourceName', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _urlToImageMeta = const VerificationMeta('urlToImage');
  @override
  late final GeneratedColumn<String?> urlToImage = GeneratedColumn<String?>(
      'urlToImage', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedColumn<String?> publishedAt = GeneratedColumn<String?>(
      'publishedAt', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        sourceName,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content
      ];
  @override
  String get aliasedName => _alias ?? 'posteo';
  @override
  String get actualTableName => 'posteo';
  @override
  VerificationContext validateIntegrity(Insertable<PosteoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('sourceName')) {
      context.handle(
          _sourceNameMeta,
          sourceName.isAcceptableOrUnknown(
              data['sourceName']!, _sourceNameMeta));
    } else if (isInserting) {
      context.missing(_sourceNameMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
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
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('urlToImage')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['urlToImage']!, _urlToImageMeta));
    } else if (isInserting) {
      context.missing(_urlToImageMeta);
    }
    if (data.containsKey('publishedAt')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['publishedAt']!, _publishedAtMeta));
    } else if (isInserting) {
      context.missing(_publishedAtMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  PosteoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PosteoData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PosteoTable createAlias(String alias) {
    return $PosteoTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PosteoTable posteo = $PosteoTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [posteo];
}
