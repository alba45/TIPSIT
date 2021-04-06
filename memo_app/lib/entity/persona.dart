// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Persona {
  @primaryKey
  final int idpersona;
  
  final String name;

  Persona(this.idpersona, this.name);
}