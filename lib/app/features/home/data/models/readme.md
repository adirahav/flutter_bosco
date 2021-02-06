# Models

* Model are used to hold data that send/returned from the server.
* Some of the models contains data that are relevant to the Domain/Presentation Layers, so they are  inherent from the Entities.


# Example From This App
The Model:
```dart
class FactModel extends Fact
```

Fact is Entity that hold data for the Domain Layer and Presentation Layer, but the Fact is feched origilnally from the server it means that it has a parallel FactModel that extends it, and when it nessecery the FactModel can have more funcitons such as `toCSV`, `fromFirestore`, etc.