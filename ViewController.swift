//
//  ViewController.swift
//  To-Do-App
//
//  Created by Nika Kalandia on 9.02.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var toDos = [
    ToDo(title: "Make vanilla puding"),
    ToDo(title: "Put the puding in a mayo"),
    ToDo(title: "Eat it in a public place")
    ]
    
    let emojiArray = ["🎃","🥳","🤑","📱","💰","🎄","🔥","⭐️","👋","😎","🌏","☀️","💧","🌊","🍍","🍔","🍩","🍪","🍺","🏆","🎯","🎬","🎈","🎁","🤩","🤙","☘️","🌴","🍎"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

         
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let todo = toDos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        if let customCell = cell as? TableViewCell {
            customCell.set(title: "\(todo.title)  ", checked: todo.isComplete)
            customCell.emojiLabel.text = "\(emojiArray.randomElement()!)"
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            toDos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func addTaskButton(_ sender: Any) {
        let alert = UIAlertController(title: "Add Task", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField { field in
            field.placeholder = "What you wanna do?"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        alert.addAction(UIAlertAction(title: "Add", style: UIAlertAction.Style.default, handler: { _ in
                    
                    guard let fields = alert.textFields else { return }
                    let taskField = fields[0]
                    
                    guard let task = taskField.text, !task.isEmpty else { return }
                    
                    self.toDos.append(ToDo(title: task))
            
                    let indexPath1 = IndexPath(row: self.toDos.count - 1, section: 0)
                    self.tableView.insertRows(at: [indexPath1], with: UITableView.RowAnimation.right)
                        
                }))
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func editButton(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
}
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
      let todo = toDos.remove(at: sourceIndexPath.row)
      toDos.insert(todo, at: destinationIndexPath.row)
    }
    
    
    

}

