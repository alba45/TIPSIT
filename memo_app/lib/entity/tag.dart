// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Tag {
  @primaryKey
  final int id_tag;
  final String name;

  Tag(this.id_tag, this.name);
}