# Remote

* In this directory the real implementation of the requests to remote servers are occures. 
* If something wrong happand with the communication with the server/device, we should catch this errors in this level.

# Example From This App
```dart
Future<Fact> getRandomFact(String language);
```
This function exists in the abstract class repository_api. As we mentioned before, this function has two references:
* Data layer - the implementation of the function exists there.
* Domain layer - call to this funciton in the relevant usecase.
