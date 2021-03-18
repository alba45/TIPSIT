// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/memo.dart';

@dao
abstract class MemoDao {
  // @Query('SELECT * FROM Memo')
  // Future<List<Memo>> qm();

  // @Query('SELECT * FROM Persona WHERE id_memo = :id_memo')
  // Stream<Memo> qm1(int id_memo);

  @insert
  Future<void> insertMemo(Memo memo);
}