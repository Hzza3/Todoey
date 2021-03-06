//
//  ViewController.swift
//  Todoey
//
//  Created by Ahmed Hazzaa  on 3/11/18.
//  Copyright © 2018 Ahmed Hazzaa . All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item] ()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*if let items = defaults.array(forKey: "TodoListArray") as? [String]
        {
            itemArray = items
        }*/
        
        let item1 = Item()
        item1.title = "Pray"
        itemArray.append(item1)
        
        let item2 = Item()
        item2.title = "Eat Brakfast"
        itemArray.append(item2)
        
        let item3 = Item()
        item3.title = "Study IOS"
        itemArray.append(item3)
    }

    //MARK - TableView DataSource Methode
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemcell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add Items methods
    
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            print("creation successful")
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
            print("Success")
        }
        alert.addTextField { (addItemTextField) in
            addItemTextField.placeholder = "Create new item"
            textField = addItemTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

