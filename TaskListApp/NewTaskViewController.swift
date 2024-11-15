//
//  NewTaskViewController.swift
//  TaskListApp
//
//  Created by Evgeniy Borovoy on 11/13/24.
//

import UIKit

final class NewTaskViewController: UIViewController {
    
    weak var delegate: NewTaskViewControllerDelegate?
    
    private lazy var taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Add new task"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        let filledButton = FilledButtonFactory(
            title: "Save Task",
            backgroundColor: Colors.backgroundColor,
            foregroundColor: Colors.fillerColor,
            action: UIAction { [unowned self] _ in
                save()
            }
        )
        
        return filledButton.createButton()
    }()
    private lazy var cancelButton: UIButton = {
        let filledButton = FilledButtonFactory(
            title: "Cancel",
            backgroundColor: Colors.softRed,
            foregroundColor: Colors.fillerColor,
            action: UIAction { [unowned self] _ in
                dismiss(animated: true)
            }
        )
        
        return filledButton.createButton()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.secondaryBackgroundColor
        setupSubviews(taskTextField, saveButton, cancelButton)
        setConstraints()
    }
    
    private func save() {
        // TODO: change 
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let task = ToDoTask(context: appDelegate.persistentContainer.viewContext)
        task.title = taskTextField.text
        appDelegate.saveContext()
        delegate?.reloadData()
        dismiss(animated: true)
    }
}
// MARK: - Setup UI
private extension NewTaskViewController {
    
    func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            view.addSubview(subview)
        }
    }
        
    func setConstraints() {
        NSLayoutConstraint.activate([
            taskTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30 ),
            taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor,constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 210 ),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor,constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30 ),
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -210),
        ])
        
    }
    
}


#Preview {
    NewTaskViewController()
}
