import 'package:dartz/dartz.dart';
import 'package:course_13_full/core/error/failure.dart';
import 'package:course_13_full/feature/domain/entities/person_entity.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page);
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query);
}