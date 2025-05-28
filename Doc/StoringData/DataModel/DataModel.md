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
