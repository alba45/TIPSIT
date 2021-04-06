// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/tag.dart';

@dao
abstract class TagDao {
 @Query('SELECT * FROM Person')
  Future<List<Tag>> findAllTags();

  @Query('SELECT * FROM Person WHERE idtag = :idtag')
  Stream<Tag> findTagById(int idtag);

  @insert
  Future<void> insertTag(Tag tag);
}