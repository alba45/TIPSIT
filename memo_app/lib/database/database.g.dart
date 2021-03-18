// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MemoDao _memoDaoInstance;

  PersonaDao _personaDaoInstance;

  TagDao _tagDaoInstance;

  AccountDao _accountDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Memo` (`id_memo` INTEGER, `titolo` TEXT, `contenuto` TEXT, PRIMARY KEY (`id_memo`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Persona` (`id_persona` INTEGER, `name` TEXT, PRIMARY KEY (`id_persona`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Tag` (`id_tag` INTEGER, `name` TEXT, PRIMARY KEY (`id_tag`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Account` (`id_account` INTEGER, `email` TEXT, `password` TEXT, PRIMARY KEY (`id_account`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MemoDao get memoDao {
    return _memoDaoInstance ??= _$MemoDao(database, changeListener);
  }

  @override
  PersonaDao get personaDao {
    return _personaDaoInstance ??= _$PersonaDao(database, changeListener);
  }

  @override
  TagDao get tagDao {
    return _tagDaoInstance ??= _$TagDao(database, changeListener);
  }

  @override
  AccountDao get accountDao {
    return _accountDaoInstance ??= _$AccountDao(database, changeListener);
  }
}

class _$MemoDao extends MemoDao {
  _$MemoDao(this.database, this.changeListener)
      : _memoInsertionAdapter = InsertionAdapter(
            database,
            'Memo',
            (Memo item) => <String, Object>{
                  'id_memo': item.id_memo,
                  'titolo': item.titolo,
                  'contenuto': item.contenuto
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<Memo> _memoInsertionAdapter;

  @override
  Future<void> insertMemo(Memo memo) async {
    await _memoInsertionAdapter.insert(memo, OnConflictStrategy.abort);
  }
}

class _$PersonaDao extends PersonaDao {
  _$PersonaDao(this.database, this.changeListener)
      : _personaInsertionAdapter = InsertionAdapter(
            database,
            'Persona',
            (Persona item) => <String, Object>{
                  'id_persona': item.id_persona,
                  'name': item.name
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<Persona> _personaInsertionAdapter;

  @override
  Future<void> insertPersona(Persona persona) async {
    await _personaInsertionAdapter.insert(persona, OnConflictStrategy.abort);
  }
}

class _$TagDao extends TagDao {
  _$TagDao(this.database, this.changeListener)
      : _tagInsertionAdapter = InsertionAdapter(
            database,
            'Tag',
            (Tag item) =>
                <String, Object>{'id_tag': item.id_tag, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<Tag> _tagInsertionAdapter;

  @override
  Future<void> insertTag(Tag tag) async {
    await _tagInsertionAdapter.insert(tag, OnConflictStrategy.abort);
  }
}

class _$AccountDao extends AccountDao {
  _$AccountDao(this.database, this.changeListener)
      : _accountInsertionAdapter = InsertionAdapter(
            database,
            'Account',
            (Account item) => <String, Object>{
                  'id_account': item.id_account,
                  'email': item.email,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final InsertionAdapter<Account> _accountInsertionAdapter;

  @override
  Future<void> insertAccount(Account account) async {
    await _accountInsertionAdapter.insert(account, OnConflictStrategy.abort);
  }
}
