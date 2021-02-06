# Usecases

* here is all of the business logic of the app are implemented. any usecase that can occure on the screen pass to here and an result will be return.
* The usecases use the repository to call to Data layer methods. This can help the QA to easier make tests by replacing the repository to fake implementation. 
* The Presentation Layer make an implicit use of the use cases by rise an event that will be map to the relevant use case. When the usecase will end, it will return a result and the state of the presentation layer will updated and so the UI.


# Example From This App
```dart
class GetRandomFact implements UseCase<Fact, Params> {
    ...
    @override
    Future<Fact> call(Params params) async {
    return await repository.someFunctionFromDataLayer(params.language);
    }
}
```
This is a callable class, which means that it behave like a function, so why dont easly just create a function? 

There are some reseons for that:
1. If we were just create a function, lets thing what was happened if there where many usecases, we got huge file called, for example, `FactUsecases` with all of the implementation of all the funcitons, which will couse to confuse.
2. We could not force the developers to create function that get a repository, and what they will tend to do is the next *wrong* behavior:
```dart
class FactUsecases{
    Repository repository;
    FactUsecases(this.repository);


    ///this function was made by developer1
    Entity1 usecase1(){ 
        ...
        return repository.someFunc();    
    }

    ///this function was made by developer2
    Entity1 usecase2(){ 
        ...
        return repository.someOtherFunc();    
    }


    ///this function was made by another developer3
    Entity2 usecase3(Repository repo){
        ...
        return repo.someDifferentFunc();
    }
}
```

The problem with it is:
We miss the abillity to test our code, for example, we cant test usecase1 and mock usecase2. But if we want to test usecase1 and mock usecase3 it is possible(usecase3 is respect the dependency injection principle).
Thus *we want to force all of our developers to use the usecase3 pattern*, so to do so we create a callable abstract method called `usecase` with function that get the repository from an injection.