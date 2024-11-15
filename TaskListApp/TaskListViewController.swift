//
//  ViewController.swift
//  TaskListApp
//
//  Created by Evgeniy Borovoy on 11/13/24.
//

import UIKit

protocol NewTaskViewControllerDelegate: AnyObject {
    func reloadData()
}

enum Colors {
    static let backgroundColor = UIColor(
        red: 45/255,
        green: 98/255,
        blue: 138/255,
        alpha: 1
    )
    static let textColor = UIColor(
        red: 14/255,
        green: 47/255,
        blue: 66/255,
        alpha: 1
    )
    static let secondaryBackgroundColor = UIColor(
        red: 130/255,
        green: 195/255,
        blue: 214/255,
        alpha: 1
    )
    static let fillerColor = UIColor(
        red: 218/255,
        green: 220/255,
        blue: 213/255,
        alpha: 1
    )
    static let softRed = UIColor(
        red: 255/255,
        green: 50/255,
        blue: 50/255,
        alpha: 0.7
    )
        
    
}

final class TaskListViewController: UITableViewController {
    
    private var tasks: [ToDoTask] = []
    private let cellID = "task"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        view.backgroundColor = Colors.backgroundColor

        setupNavigationBar()
        fetchData()
    }
    
    @objc private func addTask() {
        let newTaskVC = NewTaskViewController()
        newTaskVC.delegate = self
        present(newTaskVC, animated: true)
    }
    
    private func fetchData() {
        // TODO: Change
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let fetchRequest = ToDoTask.fetchRequest()
        
        do {
            tasks = try appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            print(error)
        }
    }
    
}

// MARK: - UITableViewDataSource
extension TaskListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let ToDoTask = tasks[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = ToDoTask.title
        
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - Setup UI
private extension TaskListViewController {
    
    var titleTextColor: UIColor {
        return Colors.textColor
    }
    
    var backgroundColor: UIColor {
        return Colors.fillerColor
    }
    
    func setupNavigationBar() {
        title = "Task List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Navigation bar Appearance
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = Colors.fillerColor
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: Colors.textColor]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: Colors.textColor]
        
        // Button for navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTask)
        )
        
        navigationController?.navigationBar.tintColor = Colors.textColor
        
        // Apply appearance
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
    }
    
}

extension TaskListViewController: NewTaskViewControllerDelegate {
    func reloadData() {
        fetchData()
        tableView.reloadData()
    }
}

