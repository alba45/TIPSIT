// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/tag.dart';

@dao
abstract class TagDao {
  @Query('SELECT * FROM Person')
  Future<List<Tag>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Tag> findPersonById(int id);

  @insert
  Future<void> insertPerson(Tag person);
}