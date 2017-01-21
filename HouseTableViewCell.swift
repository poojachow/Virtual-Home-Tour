//
//  HouseTableViewCell.swift
//  VirtualHomeTour
//
//  Created by Pooja on 11/30/15.
//  Copyright (c) 2015 Pooja. All rights reserved.
//

import UIKit

class HouseTableViewCell: UITableViewCell {

    @IBOutlet weak var HouseImage: UIImageView!
    @IBOutlet weak var HouseName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
