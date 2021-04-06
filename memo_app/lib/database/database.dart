// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:memo_app/dao/accountdao.dart';
import 'package:memo_app/dao/personadao.dart';
import 'package:memo_app/dao/tagdao.dart';
import 'package:memo_app/entity/account.dart';
import 'package:memo_app/entity/memo.dart';
import 'package:memo_app/dao/memodao.dart';
import 'package:memo_app/entity/persona.dart';
import 'package:memo_app/entity/tag.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

// part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Memo,Persona,Tag,Account])
abstract class AppDatabase extends FloorDatabase {
  MemoDao get memoDao;
  PersonaDao get personaDao;
  TagDao get tagDao;
  AccountDao get accountDao;
}