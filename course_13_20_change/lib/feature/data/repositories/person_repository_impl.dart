import 'package:dartz/dartz.dart';
import 'package:course_13_full/core/error/exception.dart';
import 'package:course_13_full/core/error/failure.dart';
import 'package:course_13_full/core/platform/network_info.dart';
import 'package:course_13_full/feature/data/datasources/person_local_data_source.dart';
import 'package:course_13_full/feature/data/datasources/person_remote_data_source.dart';
import 'package:course_13_full/feature/data/models/person_model.dart';
import 'package:course_13_full/feature/domain/entities/person_entity.dart';
import 'package:course_13_full/feature/domain/repositories/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
  final PersonRemoteDataSource remoteDataSource;
  final PersonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PersonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page) async {
    return await _getPersons(() {
      return remoteDataSource.getAllPersons(page);
    });
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query) async {
    if (!await networkInfo.isConnected) {
      try {
        final cachedPersons = await localDataSource.getLastPersonsFromCache();
        final normalizedQuery = query.trim().toLowerCase();
        return Right(cachedPersons
            .where((person) => person.name.toLowerCase().contains(normalizedQuery))
            .toList());
      } on CacheException {
        return Left(CacheFailure());
      }
    }

    return await _getPersons(() {
      return remoteDataSource.searchPerson(query);
    });
  }

  Future<Either<Failure, List<PersonModel>>> _getPersons(
      Future<List<PersonModel>> Function() getPersons) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePerson = await getPersons();
        await localDataSource.personsToCache(remotePerson);
        return Right(remotePerson);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPerson = await localDataSource.getLastPersonsFromCache();
        return Right(localPerson);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
