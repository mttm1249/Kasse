//
//  RecordCell.swift
//  coins
//
//  Created by Денис on 20.03.2022.
//

import UIKit

class RecordCell: UITableViewCell {
    
    @IBOutlet weak var recordTitleLabel: UILabel!
    @IBOutlet weak var recordDateLabel: UILabel!
    
    func setup(model: RecordModel) {
        recordTitleLabel.text = model.generallyTotall
        recordDateLabel.text = model.date
    }
    
}
