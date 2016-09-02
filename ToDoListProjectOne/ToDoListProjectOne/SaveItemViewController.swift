//
//  SaveItemViewController.swift
//  ToDoListProjectOne
//
//  Created by Daniel Kim on 8/31/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//



import UIKit


class SaveItemViewController: UIViewController {
    
    var savedListItem = [ItemOnList?]()
    
    var list: List?
    
    @IBOutlet weak var adjustedText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Appending New List to To Do List Scene
    var savedString = [String]()
    var newString = ""
    var updateClosure : ((newItem:String)->())?
    func sendToArray () {
        guard let updatedText = adjustedText?.text, updatedText.isEmpty else {
            //let text = text/
            return }
        savedString.append(updatedText)
    }
    
    @IBAction func saveButtonTapped(_ sender: AnyObject) {
        
        
        updateClosure?(newItem:adjustedText.text)
        
        navigationController!.popViewController(animated: true)
        // PREVENTS ONGOING SCENE REPEATS
        
        let newItem = adjustedText.text
        if let newItem = newItem {
            if let list = list {
                list.attribute = newItem
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

