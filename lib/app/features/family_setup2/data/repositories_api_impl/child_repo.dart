import 'package:bosco/app/features/family_setup/data/datasources/remote/remote_child_datasource.dart';
import 'package:bosco/app/features/family_setup/domain/entities/child.dart';
import 'package:bosco/app/features/family_setup2/domain/repositories_api/child_repo.dart';
import 'package:bosco/core/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class ChildRepositoryImpl implements ChildRepository {
  final ChildRemoteDataSource remoteDataSource;

  ChildRepositoryImpl({
    @required this.remoteDataSource,
  });

  @override
  Future<Either<ServerException, Child>> getRandomChild(String language) async {
    return remoteDataSource.getRandomChild(language);
  }
}
