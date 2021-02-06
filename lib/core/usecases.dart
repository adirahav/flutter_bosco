import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call({@required Params params});
}

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call({@required Params params});
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
