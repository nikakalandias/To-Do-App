//
//  ViewController.swift
//  To-Do-App
//
//  Created by Nika Kalandia on 9.02.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let toDos = [
    ToDo(title: "Make vanilla puding."),
    ToDo(title: "Put the puding in a mayo."),
    ToDo(title: "Eat it in a public place.")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let todo = toDos[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        if let customCell = cell as? TableViewCell {
            customCell.taskLabel.text = todo.title
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    


}

