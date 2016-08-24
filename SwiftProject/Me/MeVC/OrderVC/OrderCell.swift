//
//  OrderCell.swift
//  SwiftProject
//
//  Created by User on 16/8/9.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class OrderCell: UITableViewCell {
    
    @IBOutlet weak var orderidLab: UILabel!
    
    @IBOutlet weak var statusLab: UILabel!
    
    @IBOutlet weak var iconImv: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    
        selectionStyle = UITableViewCellSelectionStyle.None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
