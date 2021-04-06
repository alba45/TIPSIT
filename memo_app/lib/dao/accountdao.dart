// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/account.dart';

@dao
abstract class AccountDao {
 @Query('SELECT * FROM Person')
  Future<List<Account>> findAllAccount();

  @Query('SELECT * FROM Person WHERE idaccount = :idaccount')
  Stream<Account> findAccountById(int idaccount);

  @insert
  Future<void> insertPerson(Account account);
}