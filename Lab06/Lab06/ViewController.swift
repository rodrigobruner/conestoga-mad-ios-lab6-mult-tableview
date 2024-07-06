//
//  ViewController.swift
//  Lab06
//
//  Created by user228347 on 7/3/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var textCategory: UITextField!
    
    @IBOutlet weak var textTask: UITextField!
    
    var lastRowSelected: IndexPath?
    
    var loadData = false;
    
    
    var tasks:[Task] = []
    
    var groupedTasks: [String: [Task]] = [:]
    var categoryKeys: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addSample()
        self.groupedTasks = Dictionary(grouping: tasks, by: { $0.category })
        categoryKeys = groupedTasks.keys.sorted()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func addSample(){
        if !self.loadData {
            self.tasks = [
                Task(title: "Lab 06", category: "IOS"),
                Task(title: "Midterm", category: "IOS"),
                Task(title: "Personal homepage with HTML & CSS", category: "WEB"),
                Task(title: "E-commerce with PHP", category: "WEB"),
                Task(title: "Individual assignment", category: "UX/UI"),
                Task(title: "Prototyping an app", category: "UX/UI"),
                Task(title: "UML Diagrams", category: "ANALYSIS"),
                Task(title: "Website with C#", category: "DEVELOPMENT TECHNIQUES"),
            ]
            self.loadData = true;
        }
    }
    
    
    @IBAction func addTask(_ sender: Any) {
        super.viewWillAppear(true)
        let category = self.textCategory.text ?? "Undefined"
        let task = self.textTask.text ?? ""
        self.tasks.append(Task(title: task, category: category))
        self.groupedTasks = Dictionary(grouping: self.tasks, by: { $0.category })
        self.categoryKeys = self.groupedTasks.keys.sorted()
        self.tableView?.reloadData()
    }
    
    @IBAction func removeTask(_ sender: Any) {
        guard let indexPath = lastRowSelected else {return}
        self.lastRowSelected = nil
        let category = categoryKeys[indexPath.section]
        guard var tasksInCategory = groupedTasks[category] else { return }
              
        tasksInCategory.remove(at: indexPath.row)
              

        if tasksInCategory.isEmpty {
            groupedTasks.removeValue(forKey: category)
            categoryKeys = groupedTasks.keys.sorted()
        } else {
            groupedTasks[category] = tasksInCategory
        }
              
        if tasksInCategory.isEmpty {
            tableView.deleteSections(IndexSet(integer: indexPath.section), with: .automatic)
        } else {
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.categoryKeys.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let category = self.categoryKeys[section]
        return self.groupedTasks[category]?.count ?? 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)

        let category = categoryKeys[indexPath.section]
        if let task = groupedTasks[category]?[indexPath.row] {
            cell.textLabel?.text = task.title
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categoryKeys[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lastRowSelected = indexPath
    }
}
