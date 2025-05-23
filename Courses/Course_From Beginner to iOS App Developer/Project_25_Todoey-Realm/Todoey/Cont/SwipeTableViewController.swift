//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Maksym Poskannyi on 23.05.2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    // WHEN USER ACTUALLY SWIPE CELL
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
            
            print("Delete row \(indexPath.row)")
        
//            if let categoryForDelition = self.categories?[indexPath.row]{
//                do {
//                    
//                    try self.realm.write {
//                        self.realm.delete( categoryForDelition)
//                    }
//                } catch {
//                    print("Error deleting category: \(error)")
//                }
//            }
            
            
        }

        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")

        return [deleteAction]
    }
    
    func collectionView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
    
        return options
    }
}
