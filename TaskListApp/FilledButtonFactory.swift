//
//  FilledButtonFactory.swift
//  TaskListApp
//
//  Created by Evgeniy Borovoy on 11/13/24.
//

import UIKit

protocol ButtonFactory {
    
    func createButton() -> UIButton
}

final class FilledButtonFactory: ButtonFactory {
    
    let title: String
    
    let backgroundColor: UIColor
    
    let foregroundColor: UIColor
    
    let action: UIAction
    
    init(title: String, backgroundColor: UIColor, foregroundColor: UIColor, action: UIAction) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.action = action
    }
    
    func createButton() -> UIButton {
        var attributes = AttributeContainer()
        attributes.font = UIFont.boldSystemFont(ofSize: 20)
        
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.attributedTitle = AttributedString(title,attributes: attributes)
        buttonConfiguration.baseBackgroundColor = backgroundColor
        buttonConfiguration.baseForegroundColor = foregroundColor
        
        let button = UIButton(configuration: buttonConfiguration, primaryAction: action)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
}
