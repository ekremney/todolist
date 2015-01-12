//
//  SecondViewController.swift
//  todolist
//
//  Created by Ekrem Doğan on 12.01.2015.
//  Copyright (c) 2015 Ekrem Doğan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var todoText: UITextField!
    @IBAction func addItemPressed(sender: AnyObject) {
        var str = todoText.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if str != "" {
            toDoList.append(str)
            
            let fixedToDoList = toDoList
            
            NSUserDefaults.standardUserDefaults().setObject(fixedToDoList, forKey: "toDoList")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            self.view.endEditing(true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    

}

