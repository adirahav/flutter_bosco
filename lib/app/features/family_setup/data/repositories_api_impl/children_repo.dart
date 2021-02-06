import 'package:bosco/app/features/family_setup/data/datasources/remote/remote_children_datasource.dart';
import 'package:bosco/app/features/family_setup/domain/entities/child.dart';
import 'package:bosco/app/features/family_setup2/domain/repositories_api/children_repo.dart';
import 'package:bosco/core/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class ChildrenRepositoryImpl implements ChildrenRepository {
  final ChildrenRemoteDataSource remoteDataSource;

  ChildrenRepositoryImpl({
    @required this.remoteDataSource,
  });

  @override
  Future<Either<ServerException, List<Child>>> getChildren(
      String language) async {
    return remoteDataSource.getChildren(language);
  }
}
