//
//  AlertTool.swift
//  SwiftProject
//
//  Created by User on 16/6/23.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class TipTool: NSObject {
    
    //单例
    static let shareTipTool = TipTool()
    
    //常量
    let tipView_W : CGFloat = 100
    
    //变量
    private lazy var tipView: UIView = {
        
        let view : UIView = Define.Xib_InitView("TipView")
       
        return view
    }()
    
    

    ///错误提示框
    func showErrorTip(tipText:String){
        
      addTipView(UIImage(named: "0606error")!, tipText: tipText)
    }
    
    
    ///成功提示框
    func showSuccessTip(tipText:String){
        
        addTipView(UIImage(named: "0510yes")!, tipText: tipText)
    }
    
    //控件
    func addTipView(image:UIImage , tipText:String){
      
        //初始化
        tipView.hidden = false
        K_Window?.addSubview(tipView)
        tipView.frame = CGRectMake((K_Screen_W-tipView_W)/2,(K_Screen_H-tipView_W-K_NavBar_H)/2, tipView_W, tipView_W);
        tipView .becomeAngel()
        
        //提示图片和文字
        let tipImv:UIImageView = tipView.viewWithTag(1) as! UIImageView
        tipImv.image = image
        
        let tipLabel : UILabel = tipView.viewWithTag(2) as! UILabel
        tipLabel.text = tipText;
        
        //2s后消失
        let time = dispatch_time(DISPATCH_TIME_NOW,
            Int64(2.0 * Double(NSEC_PER_SEC)))
        
        dispatch_after(time, dispatch_get_main_queue()) {
            self.tipView.hidden = true
        }
        

    }
}
