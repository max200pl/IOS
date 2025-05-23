# SwipeCellKit package

[Link for site](https://swiftpackageindex.com/SwipeCellKit/SwipeCellKit)

## Installation
1. Open your Xcode project.
2. Go to `File` > `Swift Packages` > `Add Package Dependency`.
3. Enter the URL of the SwipeCellKit repository: `https://github.com/swipecellkit/swipecellkit.git`
4. Choose the version you want to install (usually the latest).
5. Click `Next` and then `Finish` to add the package to your project.
6. Import the package in your Swift files where you want to use it:
   ```swift
   import SwipeCellKit
   ```
7. Use the SwipeCellKit classes and methods in your code as needed.
8. Build and run your project to see the changes.

## Usage
1. Import the SwipeCellKit module in your Swift file:
   ```swift
   import SwipeCellKit
   ```
2. Create a custom table view cell that conforms to `SwipeTableViewCell`:
   ```swift
   class CustomCell: SwipeTableViewCell {
       // Your custom cell implementation
   }
   ```
3. In your table view data source methods, use the custom cell:
   ```swift
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
       // Configure the cell
       return cell
   }
   ```
4. Implement swipe actions in your table view delegate methods:
   ```swift
   func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
           // Handle delete action
           completionHandler(true)
       }
       let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
       return configuration
   }
   ```
5. Customize the appearance and behavior of the swipe actions as needed.
6. Build and run your project to see the swipe actions in action.
