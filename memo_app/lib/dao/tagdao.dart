// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/tag.dart';

@dao
abstract class TagDao {
  @Query('SELECT * FROM Person')
  Future<List<Tag>> qt();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Tag> qt1();

  @insert
  Future<void> insertTag(Tag person);
}