//
//  TaskCell.swift
//  to-do-list
//
//  Created by Tsang Ka Kui on 5/8/2016.
//  Copyright © 2016年 Tsang Ka Kui. All rights reserved.
//

import UIKit

class TaskCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
        //self.backgroundColor = UIColor.greenColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var label: UILabel = {
        let label = UILabel()
        //label.backgroundColor = UIColor.redColor()

        let font = UIFont(name: "AmericanTypewriter", size: 14)!
        let attributes = [NSFontAttributeName: font]
        let attributedText = NSAttributedString(string: "Hello World", attributes: attributes)
        label.attributedText = attributedText
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func createViews() {
        self.addSubview(label)
        label.topAnchor.constraintEqualToAnchor(self.topAnchor, constant: 8).active = true
        label.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: -8).active = true
        label.leadingAnchor.constraintEqualToAnchor(self.leadingAnchor, constant: 8).active = true
        label.trailingAnchor.constraintEqualToAnchor(self.trailingAnchor, constant: -8).active = true
    }
    
}
