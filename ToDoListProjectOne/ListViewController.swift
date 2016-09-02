//
//  TableViewController.swift
//  ToDoListProjectOne
//
//  Created by Daniel Kim on 8/31/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import UIKit


class ItemOnList {
    var date:Int
    var title:String
    var attribute:String
    
    init(date: Int, title: String, attribute:String) {
        self.date = date
        self.title = title
        self.attribute = attribute
    }
}


class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var myIndex = Int()
    var tasks: [ItemOnList] = [ ItemOnList(date: 0, title: "", attribute: ""),
                                ItemOnList(date: 0, title: "burp", attribute: "cheese")]      // Instantiation
    
    
    func numberOfSections (in tableView:UITableView) -> Int {
        return 1
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
        
        
        
    }
    
    func tableView (_ tableview: UITableView, numberOfRowsInSection section:Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PrototypeCell", for: indexPath)
        let list = tasks[indexPath.row]
        cell.textLabel?.text = list.attribute
        
        
        return cell
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath:IndexPath)  {
        _ = tableView.indexPathForSelectedRow!
        if let _ = tableView.cellForRow(at: indexPath) {
            self.performSegue(withIdentifier: "toListSegue", sender: self)
        }
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func updateTableView(item: String)->() {
        
        let addedTask:ItemOnList? = ItemOnList(date: 0, title: "", attribute: item)
        
        tasks.append(addedTask!)
        
        tableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toListSegue" {
            //   let tasks = updatedText.text
            if let destination = segue.destination as? SaveItemViewController  {
                
                _ = tableView.indexPathForSelectedRow
                
                destination.updateClosure = updateTableView
                
                destination.savedListItem = tasks
                //      ItemOnList.append (tasks)
            }
        }
    }
    
    
    // Adding a slide delete function
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView:UITableView, commit editingStyle:UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        } else if editingStyle == .insert {
        }
    }
}
