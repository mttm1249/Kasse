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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            let bgColorView = UIView()
            bgColorView.backgroundColor = #colorLiteral(red: 0.1294117868, green: 0.1294117868, blue: 0.1294117868, alpha: 1)
            self.selectedBackgroundView = bgColorView
        }
}
