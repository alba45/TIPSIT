// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/account.dart';

@dao
abstract class AccountDao {
  @Query('SELECT titolo FROM Persona')
  Future<List<Account>> qa();

  @Query('SELECT  FROM Person WHERE id = :id')
  Stream<Account> qa2(String email, password);

  @insert
  Future<void> insertAccount(Account person);
}