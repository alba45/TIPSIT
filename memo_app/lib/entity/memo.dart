// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Memo {
  @primaryKey
  final int idmemo;

  final String titolo;
  final String contenuto;

  Memo(this.idmemo,this.titolo, this.contenuto);
}