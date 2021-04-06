// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:memo_app/entity/persona.dart';

@dao
abstract class PersonaDao {
 @Query('SELECT * FROM Person')
  Future<List<Persona>> findAllPersone();

  @Query('SELECT * FROM Person WHERE idpersona = :idpersona')
  Stream<Persona> findPersonaById(int idpersona);

  @insert
  Future<void> insertPersona(Persona persona);
}