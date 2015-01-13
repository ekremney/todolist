//
//  FirstViewController.swift
//  todolist
//
//  Created by Ekrem Doğan on 12.01.2015.
//  Copyright (c) 2015 Ekrem Doğan. All rights reserved.
//

import UIKit

var toDoList:[String] = []

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var taskTable:UITableView?

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
        
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = toDoList[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(animated: Bool) {
        
    
        if var storedToDoItems:AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") {
            
            toDoList = []
            
            for var i = 0; i < storedToDoItems.count; i++ {
                toDoList.append(storedToDoItems[i] as NSString)
            }
        }
        
        taskTable?.reloadData()
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            toDoList.removeAtIndex(indexPath.row)
            
            let fixedToDoList = toDoList
            
            NSUserDefaults.standardUserDefaults().setObject(fixedToDoList, forKey: "toDoList")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        taskTable?.reloadData()
    }

}

