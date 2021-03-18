// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/account.dart';

@dao
abstract class AccountDao {
  // @Query('SELECT titolo FROM Persona')
  // Future<List<Account>> qa();

  // @Query('SELECT  FROM Persona WHERE id_account = :id_account')
  // Stream<Account> qa2(int id_account);

  @insert
  Future<void> insertAccount(Account account);
}