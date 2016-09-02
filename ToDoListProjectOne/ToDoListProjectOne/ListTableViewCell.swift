//
//  ListTableViewCell.swift
//  ToDoListProjectOne
//
//  Created by Daniel Kim on 8/31/16.
//  Copyright © 2016 Daniel Kim. All rights reserved.
//

import Foundation
import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var listNameLabel: UILabel!
    
    @IBOutlet weak var checkBox: UIImageView!
    
    @IBAction func checkboxPressed(_ sender: UIButton) {
        
        if checkBox.image == #imageLiteral(resourceName: "check"){
            checkBox.image = #imageLiteral(resourceName: "checkboxUnchecked")
        } else {
            checkBox.image = #imageLiteral(resourceName: "check")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


