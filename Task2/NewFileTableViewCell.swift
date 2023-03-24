//
//  NewFileTableViewCell.swift
//  Task2
//
//  Created by Amit Sharma on 24/03/23.
//

import UIKit

class NewFileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var artistNameLable: UILabel!
    @IBOutlet weak var albumLable: UILabel!
    @IBOutlet weak var imageLable: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
