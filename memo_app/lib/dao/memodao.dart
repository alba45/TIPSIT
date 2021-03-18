// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/memo.dart';

@dao
abstract class MemoDao {
  @Query('SELECT * FROM Person')
  Future<List<Memo>> qm();

  //@Query('SELECT * FROM Person WHERE id = :id')
  //Stream<Memo> qm1();

  @insert
  Future<void> insertMemo(Memo person);
}