import 'package:bosco/app/features/family_setup/domain/entities/child.dart';
import 'package:bosco/core/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class ChildrenRepository {
  Future<Either<ServerException, List<Child>>> getChildren(String language);
}
