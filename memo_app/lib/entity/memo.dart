// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Memo {
  @primaryKey
  final int id_memo;
  final String titolo;
  final String contenuto;

  Memo(this.id_memo,this.titolo, this.contenuto);
}