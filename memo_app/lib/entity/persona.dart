// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Persona {
  @primaryKey
  final int id_persona;
  final String name;

  Persona(this.id_persona, this.name);
}