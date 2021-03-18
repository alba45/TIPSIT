// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/tag.dart';

@dao
abstract class TagDao {
  // @Query('SELECT * FROM Tag')
  // Future<List<Tag>> qt();

  // @Query('SELECT * FROM Tag WHERE id_tag = :id_tag')
  // Stream<Tag> qt1(int id_tag);

  @insert
  Future<void> insertTag(Tag tag);
}