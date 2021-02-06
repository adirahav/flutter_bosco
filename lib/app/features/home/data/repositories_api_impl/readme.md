# Repositories_API_Impl

* This is the impletation of the repository api that locaten in the Domain layer.
* This part of the app is the business logic of the Data layer, in order to return result to the domain layer, it can combine calls to the device and the remote.


# Example From This App
The function:
```dart
Future<Either<ServerException, Fact>> getRandomFact(String language);
```

is declared in the abstract repositor at the Domain Layer. This funciton are implemented in this directory(repositories_api_impl), the implemantation can, for example, check first if facts are already fached and save in the device(in shared preferences or other DB), if the cache is empty the implementation will make an HTTP call to the server to fetch new data.