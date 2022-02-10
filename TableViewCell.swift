//
//  TableViewCell.swift
//  To-Do-App
//
//  Created by Nika Kalandia on 9.02.2022.
//

import UIKit

class TableViewCell: UITableViewCell, BEMCheckBoxDelegate {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    
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

        updateChecked()
}
    
    func set(title: String, checked: Bool) {
      taskLabel.text = title
      set(checked: checked)
    }
    
    func set(checked: Bool) {
      checkbox.on = checked
      updateChecked()
    }
    
    private func updateChecked() {
        let attributedString = NSMutableAttributedString(string: taskLabel.text!)
      
        if checkbox.on {
        attributedString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length-1))
      } else {
        attributedString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributedString.length-1))
      }
      
      taskLabel.attributedText = attributedString
    }

}
