//
//  BuddyTableViewCell.swift
//  yoyo
//
//  Created by Ahmed, Atif on 3/11/19.
//  Copyright © 2019 Ahmed, Atif. All rights reserved.
//

import UIKit

class BuddyTableViewCell: UITableViewCell {
    
    //imageThumbnail
   
    @IBOutlet weak var imageThumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
