//
//  BaseNav.swift
//  SwiftProject
//
//  Created by User on 16/6/23.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class BaseNav: UINavigationController {
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.backgroundColor = K_NavBarColor
        UINavigationBar.appearance().tintColor = K_RedColor
        UITabBar.appearance().tintColor = K_RedColor
        
    }

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if self.viewControllers.count > 0 {
            
             //1.隐藏push进来的控制器bottomBar
           viewController.hidesBottomBarWhenPushed = true
            
            //2.左边item事件
           viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"0225back"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(BaseNav.back))
        }
        
        
        //调用父类方法
        super.pushViewController(viewController, animated: true)
    }
    

    func back(){
        
      popViewControllerAnimated(true)
    }
    
}
