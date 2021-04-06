// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/memo.dart';

@dao
abstract class MemoDao{

  @Query('SELECT * FROM memo')
  Future<List<Memo>> getAllMemo();

  @Query('SELECT * FROM memo WHERE titolo=:titolo')
  Stream<List<Memo>> getMemoByTitle(String titolo);

  @Query('SELECT * FROM memo WHERE idmemo=:idmemo')
  Future<Memo> getMemoById(int idmemo);

  @Query('DELETE FROM memo')
  Future<void> deleteAllMemo();

  @insert
  Future<void> insertMemo(Memo memo);

  @update
  Future<void> updateMemo(Memo memo);

  @delete
  Future<void> deleteMemo(Memo memo);
}