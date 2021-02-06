import 'package:bosco/app/features/home/data/datasources/remote/remote_fact_datasource.dart';
import 'package:bosco/app/features/home/domain/entities/fact.dart';
import 'package:bosco/app/features/home/domain/repositories_api/fact_repo.dart';
import 'package:bosco/core/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class FactRepositoryImpl implements FactRepository {
  final FactRemoteDataSource remoteDataSource;

  FactRepositoryImpl({
    @required this.remoteDataSource,
  });

  @override
  Future<Either<ServerException, Fact>> getRandomFact(String language) async {
    return remoteDataSource.getRandomFact(language);
  }
}
