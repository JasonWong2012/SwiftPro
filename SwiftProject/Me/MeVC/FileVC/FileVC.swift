//
//  FileVC.swift
//  SwiftProject
//
//  Created by User on 16/8/18.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class FileVC: BaseTableVC {

    @IBOutlet weak var msgBox: UILabel!
    
    @IBOutlet weak var featureBox: UILabel!
    
    @IBOutlet weak var iconImv: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        msgBox.becomeAngel(K_RedColor)
        featureBox.becomeAngel(K_RedColor)
        iconImv.becomeRound()

    }
 

}
