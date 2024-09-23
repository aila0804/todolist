//
//  ViewController.swift
//  todolist
//
//  Created by Aila Aila on 22.09.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addtask(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        let taskName = textfield.text!
        
        var newTask = TaskItem()
        
        newTask.name = taskName
        
//        var taskArray:[TaskItem] = []
        
        do {
            if let data = defaults.data(forKey: "taskItemArray") {
                var array = try JSONDecoder().decode([TaskItem].self, from: data)
                
                array.append(newTask)
                
                let encodeData = try JSONEncoder().encode(array)
                
                defaults.set(encodeData, forKey: "taskItemArray" )
                
            } else {
                
                let encodeData = try JSONEncoder().encode([newTask])
                
                defaults.set(encodeData, forKey: "taskItemArray" )
            }
            
            
        } catch {
            print("unable to encode \(error)")
        }
        
        
        
        
        
//        if let array = defaults.array(forKey: "taskItemArray") {
//            taskArray = array as! [TaskItem]
//            
//            taskArray.append(newTask)
//            
//            defaults.set(taskArray, forKey: "taskItemArray")
//        } else {
//            let array = [newTask]
//            defaults.set(taskArray, forKey: "taskItemArray")
//        }
        
//        var taskArray:[String] = []
//        
//        if let array = defaults.array(forKey: "taskArray") {
//            
//            taskArray = array as! [String]
//            
//            taskArray.append(taskName)
//            
//            defaults.set(taskArray, forKey: "taskArray")
//            
//        } else {
//            
//            let array = [taskName]
//            
//            defaults.set(array, forKey: "taskArray")
//        }
        textfield.text = ""
    }
}

