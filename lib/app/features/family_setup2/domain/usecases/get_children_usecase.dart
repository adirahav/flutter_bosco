import 'package:bosco/app/features/family_setup/domain/entities/child.dart';
import 'package:bosco/app/features/family_setup2/domain/repositories_api/children_repo.dart';
import 'package:bosco/core/exceptions.dart';
import 'package:bosco/core/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart'; //for annotations such as @required

class GetChildrenUsecase
    implements UseCase<Either<ServerException, List<Child>>, Params> {
  final ChildrenRepository repository;

  GetChildrenUsecase(this.repository);

  @override
  Future<Either<ServerException, List<Child>>> call(
      {@required Params params}) async {
    return await repository.getChildren(params.language);
  }
}

class Params extends Equatable {
  final String language;

  Params({@required this.language});

  @override
  List<Object> get props => [language];
}
