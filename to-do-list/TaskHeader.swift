//
//  TaskHeader.swift
//  to-do-list
//
//  Created by Tsang Ka Kui on 5/8/2016.
//  Copyright © 2016年 Tsang Ka Kui. All rights reserved.
//

import UIKit

class TextField: UITextField {
    
    var padding = UIEdgeInsets (top: 0, left: 15, bottom: 0, right: 10)
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return  UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}

class TaskHeader: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var textField: TextField = {
       let textField = TextField()
        textField.placeholder = "Add new to-do task"
        textField.borderStyle = .Line
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var button: UIButton = {
        let button = UIButton(type: .System)
        let font = UIFont(name: "Arial", size: 18)!
        let color = UIColor.whiteColor()
        let attributes = [NSFontAttributeName: font, NSForegroundColorAttributeName: color]
        let attributedText = NSAttributedString(string: "Add", attributes: attributes)
        button.setAttributedTitle(attributedText, forState: .Normal)
        button.backgroundColor = UIColor.blackColor()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Header"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func createViews() {
   
        addSubview(textField)
        addSubview(button)
        
        let topMargin: CGFloat = 20.0
        let bottomMargin: CGFloat = -20.0
        
        textField.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: topMargin).active = true
        textField.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: bottomMargin).active = true
        textField.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: 10).active = true
        textField.trailingAnchor.constraintEqualToAnchor(button.leadingAnchor, constant: -10).active = true
        
        button.widthAnchor.constraintEqualToConstant(80).active = true
        button.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: topMargin).active = true
        button.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: bottomMargin).active = true
        button.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor, constant: -10).active = true
        button.addTarget(self, action: #selector(addTask), forControlEvents: .TouchUpInside)
    }
    
    func addTask() {
        if let task = textField.text where task != "" {
            NSNotificationCenter.defaultCenter().postNotificationName("addTask", object: nil, userInfo: ["taskName": task])
            textField.text = ""
        }
    }
}
