//
//  HomeTableViewCell.swift
//  Villon
//
//  Created by Bing on 2017/5/16.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var contentlabel: UILabel!
    @IBOutlet var datelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
