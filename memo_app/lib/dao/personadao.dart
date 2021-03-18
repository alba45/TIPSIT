// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/persona.dart';

@dao
abstract class PersonaDao {
  @Query('SELECT * FROM Person')
  Future<List<Persona>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Persona> findPersonById(int id);

  @insert
  Future<void> insertPerson(Persona person);
}