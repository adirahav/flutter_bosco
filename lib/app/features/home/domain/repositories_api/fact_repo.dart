import 'package:bosco/app/features/home/domain/entities/fact.dart';
import 'package:bosco/core/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class FactRepository {
  Future<Either<ServerException, Fact>> getRandomFact(String language);
}
