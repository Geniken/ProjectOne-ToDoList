//
//  CheckBoxControl.swift
//  ToDoListProjectOne
//
//  Created by Daniel Kim on 9/1/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//


import Foundation

import UIKit

class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "check")! as UIImage
    let uncheckedImage = UIImage(named: "checkboxUnchecked")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: Selector(("buttonClicked:")), for: UIControlEvents.touchUpInside)
        self.isChecked = false
    }
    
    func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
 
