//
//  HomeTopView.swift
//  SwiftProject
//
//  Created by User on 16/7/19.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class HomeTopView: UIScrollView {
    
    let Kcount : CGFloat = 4
    
     lazy var picArr = [UIImageView]()
    
    
    override func awakeFromNib() {

        addUI()
        getHomePicture()
    }

}


//MARK:UI
extension HomeTopView{
  
    func addUI(){
        
        //属性
        self.contentSize = CGSizeMake(Kcount * K_Screen_W ,0);//滚动范围
        self.pagingEnabled = true
        self.bounces = false
        
        //控件
        for i in 0 ..< 4  {
            
            let imv = UIImageView ()
            addSubview(imv)
            imv.frame = CGRectMake(K_Screen_W * CGFloat(i), 0, K_Screen_W,K_Screen_H*0.3)
            imv.image = UIImage(named: "0202noWifi")
            picArr.append(imv)
        }
    }
}

 //MARK:首页图片
extension HomeTopView{
    
    func getHomePicture()  {
        
        TipTool.showHud(K_Window!, text: "正在加载...")
        
      NetTool.shareNetTool.getHomePictures { (dic) in
        
        TipTool.hidHud(K_Window!)
        
        if Define.reqSuccess(dic!) == true {
            
            if let result = dic!["value"] as? NSArray{
                
                result.enumerateObjectsUsingBlock({ (obj, i,isStop
                    ) in
                    
                   let imv = self.picArr[i]
                    
                   let link = obj["ImageLinkAPP"] as? String
                    
                    imv.sd_setImageWithURL( NSURL(string:K_Image_Url + link!), placeholderImage: UIImage(named: "0202noWifi"))
                    
                })
            }
        }
        
        
        }
    }
}