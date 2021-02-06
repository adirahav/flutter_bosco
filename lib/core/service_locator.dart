import 'package:fact_app/data/datasources/remote/remote_fact_datasource.dart';
import 'package:fact_app/data/repositories_api_impl/fact_repo.dart';
import 'package:fact_app/domain/repositories_api/fact_repo.dart';
import 'package:fact_app/domain/usecases/fetch_new_fact_usecase.dart';
import 'package:fact_app/domain/usecases/stream_facts_usecase.dart';
import 'package:fact_app/presentation/state_management/facts_store/facts_store.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

///
/// What should I init in the service locator?
///   1. Objects that you want to get from any line of code in your project.
///   2. Objects that you will mock in the tests - this is means
///       that any mock object, is consumed by its consumers in their constractors,
///       and its allows us to replace it with a mock in the constractors
///       when we tests & creates  the consumers.
///
Future<void> init() async {
  // Use cases
  serviceLocator
      .registerLazySingleton(() => GetRandomFactUsecase(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => StreamFactsUsecase(serviceLocator()));

  //state managment
  serviceLocator.registerLazySingleton<FactsStore>(() => FactsStore());

  // Repository
  serviceLocator.registerLazySingleton<FactRepository>(
    () => FactRepositoryImpl(
      remoteDataSource: serviceLocator(),
    ),
  );

  // Data sources
  serviceLocator.registerLazySingleton<FactRemoteDataSource>(
    () => FactRemoteDataSourceImpl(client: serviceLocator()),
  );

  // External
  serviceLocator.registerLazySingleton(() => http.Client());
}
