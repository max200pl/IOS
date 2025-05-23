//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift


class TodolistViewController: SwipeTableViewController {
    var todoItems:Results<Item>?
    let realm = try! Realm()
    
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //SET SELECTED CATEGORY
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
    
    // JUST Before USER SEE SKREEN
    override func viewWillAppear(_ animated: Bool) {
        guard let navBar = navigationController?.navigationBar else {fatalError("Navigation Bar not found")}
        
        navBar.barTintColor = UIColor(named: "#1D9BF6")
    }
    
    //MARK: - TABLE ACTIONS
    
    // DEF CELS COUNT
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    // DEF CELS
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // SWIPE CEL
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let item = todoItems?[indexPath.row] {
            //Set text for text label
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark: .none
        } else {
            cell.textLabel?.text = "No ToDos added yet";
        }
        
        return cell
    }
    
    
    // SELECT CELL
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write {
                    item.done = !item.done
                    
                    //DELEATE ITEM
//                    realm.delete(item)
                }
            } catch {
                print("Error saving data: \(error)")
            }
        }
        
        tableView.reloadData( )
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
                        newItem.dateCreated = Date()
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
        //FILTERED CURENT ITEM
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        
        tableView.reloadData()
    }
    
    override func updateModel(at indexPath: IndexPath) {
        if let itemToDelete = todoItems?[indexPath.row] {
            do {
                try realm.write {
                    realm.delete(itemToDelete)
                }
            } catch {
                print("Error deleting item: \(error)")
            }
        }
    }
}

//MARK: - UISearchBarDelegate WORKING WITH SEARCH BAR

extension TodolistViewController: UISearchBarDelegate {
    
    // FILTERING BY SEARCH BAR
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        todoItems  = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        
        tableView.reloadData()
    }
    
    // WHEN WE DISMISS
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            LoadItems()
            
            // Wating when main thread
            DispatchQueue.main.async {
                // IF not long time did nothing cursor disaprear and ceyboard
                searchBar.resignFirstResponder()
            }
        }
    }
}



