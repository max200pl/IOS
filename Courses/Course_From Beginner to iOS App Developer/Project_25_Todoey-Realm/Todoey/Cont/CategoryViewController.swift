//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Maksym Poskannyi on 22.05.2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit

class CategoryViewController: UITableViewController {
    
    // INIT REALM
    let realm = try! Realm()
    
    // DEF Results Realm
    var categories:Results<Category>?
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        
        tableView.rowHeight = 80
    }
    
    //MARK: - TableView DataSource Methods
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SwipeTableViewCell
//        cell.delegate = self
//        return cell
//    }
//
    
    // RETRUN length ROWS FOR TABLE
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    // DEF ONE CEL
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! SwipeTableViewCell
        
        cell.delegate = self

        cell.textLabel?.text = categories?[indexPath.row].name ?? "No categories added yet"
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    
    // WHEN WE CLICK ON CELL
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodolistViewController
        
        //DEF DISTANATION FOR OPEN NEW VIEW
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
         
    }
    

    //MARK: - Data Manipulation Methods
    
    func loadCategories() {
        //FETCH ALL OBJECTS realm
        categories = realm.objects(Category.self)
        
        tableView.reloadData()
    }
    
    
    func save(category: Category) {
        do {
            try realm.write{
                realm.add(category)
            }
        } catch {
            print("Error saving category: \(error)")
        }
        
        tableView.reloadData()
    }
    
    
    //MARK: - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
         
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newCategory = Category()
            
            newCategory.name = textField.text!
            
            self.save(category: newCategory)
        }
        
        alert.addAction(action)
        
        
        alert.addTextField{ (field) in
            textField = field
            textField.placeholder = "Enter new category name"
        }
        
        present(alert, animated: true, completion: nil )
        
    }
}

//MARK: - SwipeTableViewCellDelegate

extension CategoryViewController: SwipeTableViewCellDelegate {
    
    // WHEN USER ACTUALLY SWIPE CELL
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
        
            if let categoryForDelition = self.categories?[indexPath.row]{
                do {
                    
                    try self.realm.write {
                        self.realm.delete( categoryForDelition)
                    }
                } catch {
                    print("Error deleting category: \(error)")
                }
            }
            
            
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
