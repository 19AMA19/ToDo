//
//  TaskTableViewCell.swift
//  ToDo
//
//  Created by Abdulkarim Alansari on 02/02/1443 AH.
//

import UIKit

protocol checkButondelegate{
    func checkTaskTapped(at index: IndexPath)
}

class TaskTableViewCell: UITableViewCell {

    var delegate: checkButondelegate!
    var indexPath: IndexPath!
    
    @IBOutlet weak var cellLable: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btn(_ sender: Any) {
    }
    
}
