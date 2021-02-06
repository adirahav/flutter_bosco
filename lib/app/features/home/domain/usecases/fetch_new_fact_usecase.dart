import 'package:bosco/app/features/home/domain/entities/fact.dart';
import 'package:bosco/app/features/home/domain/repositories_api/fact_repo.dart';
import 'package:bosco/core/exceptions.dart';
import 'package:bosco/core/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart'; //for annotations such as @required

class GetRandomFactUsecase
    implements UseCase<Either<ServerException, Fact>, Params> {
  final FactRepository repository;

  GetRandomFactUsecase(this.repository);

  @override
  Future<Either<ServerException, Fact>> call({@required Params params}) async {
    return await repository.getRandomFact(params.language);
  }
}

class Params extends Equatable {
  final String language;

  Params({@required this.language});

  @override
  List<Object> get props => [language];
}
