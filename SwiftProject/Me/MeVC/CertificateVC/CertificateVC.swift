//
//  CertificateVC.swift
//  SwiftProject
//
//  Created by User on 16/8/18.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class CertificateVC: BaseTableVC {

    @IBOutlet weak var IDBox: UILabel!
    @IBOutlet weak var degreeBox: UILabel!
    @IBOutlet weak var teacherBox: UILabel!
    @IBOutlet weak var honorBox: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IDBox.becomeAngel(K_RedColor)
        degreeBox.becomeAngel(K_RedColor)
        teacherBox.becomeAngel(K_RedColor)
        honorBox.becomeAngel(K_RedColor)

        
    }

  }
