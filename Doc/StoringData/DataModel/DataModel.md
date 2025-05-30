# DataModel in swift

1. entity its the same as the class

## Difference between .xcdatamodel and .xcdatamodeld

✅ **.xcdatamodeld** — This is a directory where Xcode can store multiple versions of the data model. It is the default format and the one you should use if you want support for migrations and versioning of Core Data models.

⚠️ **.xcdatamodel** — This is a single file representing one version of the model. It is used inside .xcdatamodeld but should not be created manually as a standalone file.

### Which one to choose?

Choose **.xcdatamodeld** — it is the correct and standard option. Xcode will automatically create the first .xcdatamodel version inside the .xcdatamodeld directory.

#### In short

- **.xcdatamodeld** — A folder for versions (this is what you work with).
- **.xcdatamodel** — A single model file (automatically created by Xcode inside the folder).

## Entity

### What is an Entity?

An entity in Core Data is a representation of a data model object. It defines the structure of the data, including its attributes and relationships with other entities. Each entity corresponds to a table in a database, where each instance of the entity represents a row in that table.

### How to Create an Entity

1. Open your `.xcdatamodeld` file in Xcode.
2. Click the "+" button at the bottom of the Entities section to add a new entity.
3. Name your entity (e.g., `Person`, `Car`, etc.).

### Entity Class

Class `Codegen`gen refers to how Xcode generates the class for the entity. There are three options:

- **Manual/None**: You will manually create the class for the entity.
- **Class Definition**: Xcode generates a class for the entity, but you can customize it.
- **Category/Extension**: Xcode generates a class and an extension for the entity, allowing you to add custom methods without modifying the generated code.

### Relationships
Relationships define how entities are connected to each other. For example, a `Person` entity might have a relationship to a `Car` entity, indicating that a person can own multiple cars.

### How to Create a Relationship

1. Select the entity you want to add a relationship to.
2. Click the "+" button in the Relationships section.
3. Name the relationship (e.g., `cars` for a `Person` entity).
4. Set the destination entity (e.g., `Car`).

### Relationship Types
- **To-One**: A single instance of the destination entity (e.g., a person owns one car).
- **To-Many**: Multiple instances of the destination entity (e.g., a person owns multiple cars).

### Delete Rule

- **Nullify**: If the source entity is deleted, the relationship is set to nil. (If we delete a person, their cars will still exist but will no longer be associated with that person).
- **Cascade**: If the source entity is deleted, the destination entities are also deleted. (If we delete a person, all their cars are deleted).
- **Deny**: If the source entity is deleted, the deletion is denied if there are related destination entities. (If we try to delete a person with cars, it will not allow the deletion).

