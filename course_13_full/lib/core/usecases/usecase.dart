import 'package:dartz/dartz.dart';
import 'package:course_13_full/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}