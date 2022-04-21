//
//  CustomTableViewCell.swift
//  coins
//
//  Created by Денис on 20.03.2022.
//

import Foundation
import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recordTitleLabel: UILabel!
    @IBOutlet weak var recordDateDateLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
