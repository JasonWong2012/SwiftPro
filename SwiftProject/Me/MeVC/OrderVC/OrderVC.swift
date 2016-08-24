//
//  OrderVC.swift
//  SwiftProject
//
//  Created by User on 16/7/27.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class OrderVC: BaseVC {
   
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var classBtn: UIButton!//待上课btn
    
    @IBOutlet weak var lineLeftConstrain: NSLayoutConstraint!
    
    @IBOutlet var menuBtnArr: [UIButton]! //存放4个按钮
    
    
    lazy var selectBtn = UIButton ()
    lazy var pageDouble = 0.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化
        addChildVC()
        
        //默认待上课
        menuBtnsAction(classBtn)
        
    }
    
    
    //MARK:初始化
    func addChildVC(){
        
        scrollView.contentSize = CGSizeMake(K_Screen_W * 4, 0)
        scrollView.contentInset = UIEdgeInsetsMake(0, 5, 0, 5)
        
        for i in 0 ..< 4  {
            
            let smallOrderVC = SmallOrderVC ()
            self.addChildViewController(smallOrderVC)
            scrollView.addSubview(smallOrderVC.view)
            smallOrderVC.view.frame = CGRectMake(CGFloat(i) * K_Screen_W, 0, K_Screen_W, scrollView.height)
 
        }
    }
    
    
    //MARK:4个菜单按钮的事件
    @IBAction func menuBtnsAction(sender: UIButton) {
        
        //1.切换tableView
        let x =  CGFloat(sender.tag) * scrollView.width
        scrollView.setContentOffset( CGPointMake(x, 0), animated: true)
        
        //2.设置菜单按钮颜色
        selectBtn.setTitleColor(K_GrayColor, forState: UIControlState.Normal)
        sender.setTitleColor(K_RedColor, forState: UIControlState.Normal)
        selectBtn = sender
        
        //3.线条移动
        lineLeftConstrain.constant = sender.x
        
    }
    
    //MARK:在滚动
    func scrollViewDidScroll(scrollView: UIScrollView){
       
        //1.垂直滚动就不往下走！
        if (scrollView.contentOffset.y > 0 || scrollView.contentOffset.y < 0) {
            return;
        }
        
        
        // 2.水平滚动距离
        let offsetX : CGFloat = scrollView.contentOffset.x;
        
        // 3.页码
        pageDouble = Double(offsetX / scrollView.width);
        
        
    }
    
    //MARK:滚动完毕
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        
        //1.line位置
        lineLeftConstrain.constant =  K_Screen_W * CGFloat(pageDouble/4.0)
        
        //2.设置菜单按钮颜色
        selectBtn.setTitleColor(K_GrayColor, forState: UIControlState.Normal)
        let sender = menuBtnArr[Int(pageDouble)]
        sender.setTitleColor(K_RedColor, forState: UIControlState.Normal)
        selectBtn = sender
        
    }
    

}

 