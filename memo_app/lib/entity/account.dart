// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Account {
  @primaryKey
  final int idaccount;
  
  final String email;
  final String password;

  Account(this.idaccount, this.email, this.password);
}