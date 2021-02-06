# Repository

* The data layer use the repository_api as an interface to implement.
* The domain layer use the implemented repostiroty_api(that exists in the data layer) in order to implement the different usecases of the app.

# Example From This App
```dart
Future<Fact> getRandomFact(String language);
```
This function exists in the abstract class repository_api. As we mentioned before, this function has two references:
* Data layer - the implementation of the function exists there.
* Domain layer - call to this funciton in the relevant usecase.
