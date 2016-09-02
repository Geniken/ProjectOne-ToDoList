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
    
    var tasks: [ItemOnList] = [ ItemOnList(date: 0, title: "thing", attribute: "attributeThing")]
    
    func numberOfSections (in tableView:UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView (_ tableview: UITableView, numberOfRowsInSection section:Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"PrototypeCell") as! ListTableViewCell!
        let list = tasks[indexPath.row]
        cell?.listNameLabel?.text = list.attribute
        
        return cell!
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath:IndexPath)  {
        _ = tableView.indexPathForSelectedRow!
        if let _ = tableView.cellForRow(at: indexPath) {
            self.performSegue(withIdentifier: "toListSegue", sender: self)
        }
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
     override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toListSegue" {
            if let destination = segue.destination as? SaveItemViewController{
    
                let path = tableView.indexPathForSelectedRow
        
               destination.savedListItem = tasks
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

