import 'package:dartz/dartz.dart';
import 'package:course_13_full/core/error/failure.dart';

abstract class UseCase<Result, Params> {
  Future<Either<Failure, Result>> call(Params params);
}
