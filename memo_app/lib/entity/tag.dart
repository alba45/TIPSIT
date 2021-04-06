// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Tag {
  @primaryKey
  final int idtag;
  
  final String name;

  Tag(this.idtag, this.name);
}