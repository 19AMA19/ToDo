//
//  ViewController.swift
//  ToDo
//
//  Created by Abdulkarim Alansari on 01/02/1443 AH.
//

import UIKit

struct Task {
    var taskTitle: String?
    var isCompleted = false
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, checkButondelegate {
    
    var taskArray = [Task] ()
    
    
    @IBOutlet weak var taskTitle: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if taskArray.count > 0 {
            return taskArray.count
        } else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        cell.delegate = self
        cell.indexPath = indexPath
        cell.cellLable.text = taskArray[indexPath.row].taskTitle
        
        if taskArray[indexPath.row].isCompleted{
            cell.checkButton.setImage(#imageLiteral(resourceName: "checkedButton"), for: .normal)
        } else{
            cell.checkButton.setImage(#imageLiteral(resourceName: "uncheckedButton"), for: .normal)
        }
        
        return cell
    }

    func checkTaskTapped(at index: IndexPath) {
        if taskArray[index.row].isCompleted{
            taskArray[index.row].isCompleted = false
        }else{
            taskArray[index.row].isCompleted = true
        }
        tableView.reloadData()
    }
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        if taskTitle.hasText{
            let newTask = Task(taskTitle: taskTitle.text, isCompleted: false)
            taskArray.insert(newTask, at: 0)
            tableView.reloadData()
        }
        taskTitle.text = ""
        taskTitle.resignFirstResponder()
        
    }
    
}

