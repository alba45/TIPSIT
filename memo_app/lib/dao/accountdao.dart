// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/account.dart';

@dao
abstract class AccountDao {
  @Query('SELECT titolo FROM Persona')
  Future<List<Account>> findAllMemoOfAPerson();

  @Query('SELECT  FROM Person WHERE id = :id')
  Stream<Account> findPersonByEmailAndPw(String email, password);

  @insert
  Future<void> insertPerson(Account person);
}