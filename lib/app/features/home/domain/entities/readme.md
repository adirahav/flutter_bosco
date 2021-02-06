# Entities

* The presentation layer use the entities as a datavalues and responsible to render the relevant data on the screen.
* The data layer models are used the entities as an interface, i.e,
any entity that are feched from the data layer has(probably) a related model that `extends` it.
* This kind of interface allows the Data layer developers to communicate with the Presentation/Domain layer and agree for the right class and fields to use. Then the Data layers developers can `extends` the entities and implement their relevant methods for the model.

# Example From This App
`Fact` is the entity that are declared in the domain/entity directory.
`FactModel` is the related model that fetch the Fact from the database.

