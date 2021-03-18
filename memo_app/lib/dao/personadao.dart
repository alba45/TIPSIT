// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/persona.dart';

@dao
abstract class PersonaDao {
  // @Query('SELECT * FROM Persona')
  // Future<List<Persona>> qp();

  // @Query('SELECT * FROM Persona WHERE id_persona = :id_persona')
  // Stream<Persona> qp1(int id_persona);

  @insert
  Future<void> insertPersona(Persona persona);
}