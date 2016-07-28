//
//  SetVC.swift
//  SwiftProject
//
//  Created by User on 16/7/19.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class SetVC: BaseTableVC {
    
    
    @IBOutlet weak var cacheLab: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
 
    //退出
    @IBAction func loginOutAction(sender: UIButton) {
        
        //1.清数据
         K_Udf.removeObjectForKey("uid")
         K_Udf.removeObjectForKey("phone")
         K_Udf.removeObjectForKey("pwd")
        
        //2.去登录
        let loginVC = Define.Storyboard_InitVC("LoginVC")
        let baseNav = BaseNav(rootViewController: loginVC)
        self.view.window!.rootViewController = baseNav
    }
}
