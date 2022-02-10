//
//  TableViewCell.swift
//  To-Do-App
//
//  Created by Nika Kalandia on 9.02.2022.
//

import UIKit

class TableViewCell: UITableViewCell, BEMCheckBoxDelegate {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var checkbox: BEMCheckBox!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func checkAction(_ sender: BEMCheckBox) {

        
}

}
