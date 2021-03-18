// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/memo.dart';

@dao
abstract class MemoDao {
  @Query('SELECT * FROM Person')
  Future<List<Memo>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Memo> findPersonById(int id);

  @insert
  Future<void> insertPerson(Memo person);
}