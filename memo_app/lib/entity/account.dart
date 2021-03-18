// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Account {
  @primaryKey
  final int id_account;
  final String email;
  final String password;

  Account(this.id_account, this.email, this.password);
}