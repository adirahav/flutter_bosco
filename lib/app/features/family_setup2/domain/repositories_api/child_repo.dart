import 'package:bosco/app/features/family_setup/domain/entities/child.dart';
import 'package:bosco/core/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class ChildRepository {
  Future<Either<ServerException, Child>> getRandomChild(String language);
}
