//
//  CustomCell.swift
//  Test
//
//  Created by Shayantan Santra on 10/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet var label : UILabel!
    @IBOutlet var myimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
