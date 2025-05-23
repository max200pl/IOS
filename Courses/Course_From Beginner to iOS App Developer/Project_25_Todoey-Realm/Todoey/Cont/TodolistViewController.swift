//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift


class TodolistViewController: UITableViewController {
    var todoItems:Results<Item>?
    let realm = try! Realm()
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedCategory: Category? {
        didSet {
            LoadItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Get current cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        if let item = todoItems?[indexPath.row] {
            //Set text for text label
            cell.textLabel?.text = item.title
            
            cell.accessoryType = item.done ? .checkmark: .none
        } else {
            cell.textLabel?.text = "No ToDos added yet";
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
//        todoItems?[indexPath.row].done = !((todoItems?[indexPath.row].done) != nil)
//        
//        SaveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func addButtonPress(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new ToDo", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            // What will happen once the user clicks the Add Item button on our UIAlert
            
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write{
                        let newItem = Item()
                        newItem.title = textField.text!
                        currentCategory.items.append(newItem)
                    }
                } catch {
                    print("Error saving item: \(error)")
                }
            }
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            textField.placeholder = "Add new ToDo"
            
            print(textField.text ?? "No Text")
            
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
 
    func LoadItems() {
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        
  
        
        tableView.reloadData()
    }
}

//MARK: - UISearchBarDelegate

//extension TodolistViewController: UISearchBarDelegate {
//    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
//        
//        //SEARCH DATA
//        let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
//        
//        request.predicate = predicate
//        
//        // SORTING
//        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
//        
//        request.sortDescriptors = [sortDescriptor]
//        
//        LoadItems(with: request)
//    }
//    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text?.count == 0 {
//            LoadItems()
//            
//            // Wating when main thread
//            DispatchQueue.main.async {
//                // IF not long time did nothing cursor disaprear and ceyboard
//                searchBar.resignFirstResponder()
//            }
//        }
//    }
//}
