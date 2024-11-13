//
//  ViewController.swift
//  TaskListApp
//
//  Created by Evgeniy Borovoy on 11/13/24.
//

import UIKit

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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor

        setupNavigationBar()
    }
    
    @objc private func addTask() {
        let newTaskVC = NewTaskViewController()
        present(newTaskVC, animated: true)
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

