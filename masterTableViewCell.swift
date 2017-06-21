//
//  masterTableViewCell.swift
//  lei
//
//  Created by user_04 on 2017/1/7.
//  Copyright © 2017年 chu. All rights reserved.
//

import UIKit

class masterTableViewCell: UITableViewCell {

    @IBOutlet weak var starImageView: UIImageView!
   
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
