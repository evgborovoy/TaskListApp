//
//  NewTaskViewController.swift
//  TaskListApp
//
//  Created by Evgeniy Borovoy on 11/13/24.
//

import UIKit

final class NewTaskViewController: UIViewController {
    
    private lazy var taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Add new task"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var saveButton: UIButton = {
        // set attribute for button title
        var attributes = AttributeContainer()
        attributes.font = UIFont.boldSystemFont(ofSize: 20)
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.attributedTitle = AttributedString(
            "Save Task",
            attributes: attributes
        )
        buttonConfiguration.baseBackgroundColor = Colors.backgroundColor
        buttonConfiguration.baseForegroundColor = Colors.fillerColor
        
        
        let button = UIButton(
            configuration: buttonConfiguration,
            primaryAction: UIAction { [unowned self] _ in
                    save()
            }
        )
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var cancelButton: UIButton = {
        // set attribute for button title
        var attributes = AttributeContainer()
        attributes.font = UIFont.boldSystemFont(ofSize: 20)
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.attributedTitle = AttributedString(
            "Cancel",
            attributes: attributes
        )
        buttonConfiguration.baseBackgroundColor = Colors.softRed
        buttonConfiguration.baseForegroundColor = Colors.fillerColor
        
        
        let button = UIButton(
            configuration: buttonConfiguration,
            primaryAction: UIAction { [unowned self] _ in
                dismiss(animated: true)
            }
        )
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.secondaryBackgroundColor
        setupSubviews(taskTextField, saveButton, cancelButton)
        setConstraints()
    }
    
    private func save() {
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
        
        NSLayoutConstraint.activate([saveButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor,constant: 20),
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
