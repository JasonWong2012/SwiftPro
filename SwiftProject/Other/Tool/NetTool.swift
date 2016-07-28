//
//  NetTool.swift
//  SwiftProject
//
//  Created by User on 16/6/24.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

import Alamofire

class NetTool: NSObject {
    
    ///单例对象
    static let shareNetTool: NetTool = NetTool ()

    
}


extension NetTool{
    
    //1.MARK:登录
    func login(loginName:String,passWord:String,backCall: (dic:[String:AnyObject]?) ->Void){
        
        
        let path = K_Net_1 + "action=login&loginName=\(loginName)&passWord=\(passWord)"
        
        get(path) { (dic, error) in
            
            backCall(dic: dic)
            
        }
        
    }
    
    
    //2.MARK:查询老师个人资料：
    /**
     0.查详细信息
     1.查教育/培训信息
     2.查工作信息
     3.查手机号码、email
     4.获取用户登录名和用户真实姓名,
     5.查余额Balance
     7.查看用户被浏览量
     9.查详细信息+教师荣誉证
     17.我的导航
     18个人资料
     191信息是否完善
     192基本信息
     193教学特点
     194教育经历
     195工作经历
     20  钱包余额 + 红包个数
     **/
    func getUserDetailWithType(type:String,backCall: (dic:[String:AnyObject]?) ->Void) {
        
        let path = K_Net_1 + "action=GetUserDetail&teacherID=\(K_Uid)&type=\(type)"
        
        get(path) { (dic, error) in
            
            backCall(dic: dic)
            
        }
    }
    
     //3.MARK:获取首页滚动图片
    func getHomePictures(backCall: (dic:[String:AnyObject]?) ->Void) {
        
        let path = K_Net_1 + "action=GetIndexPic"
        
        get(path) { (dic, error) in
            
            backCall(dic: dic)
        }
    }
    
      //3.MARK:获取首页新闻
    func getNewsData(pageIndex:String,pageSize:String,backCall: (dic:[String:AnyObject]?) ->Void) {
        
        let path = K_Net_1 + "action=GetNews&newstype=1&pageIndex=\(pageIndex)&pageSize=\(pageSize)"
        
        get(path) { (dic, error) in
            
            backCall(dic: dic)
            
        }
    }
    
}


extension NetTool{
    
    //MARK:最底层的get请求
    func get(path:String , backCall: (dic : [String : AnyObject]?,error : NSError?) ->()){
        
        
        //1.拼串+md5
        let currentDate = NSDate()
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let dateStr = dateFormatter.stringFromDate(currentDate)
        
        let str = dateStr.stringByAppendingString("QceduXueF@%&*(!~)^$?.").md5().uppercaseString
        let md5Url = path + "&VerSafe=" + str
        let securityStr = md5Url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
        //2.请求
        Alamofire.request(.GET, securityStr!, parameters: nil, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) in
            
            
            if response.result.isFailure
            {
//                backCall(dic: nil,error:response.result.error )
                
              TipTool.showError("网络繁忙..")
                return
            }
            
            let dic = response.result.value as? [String: AnyObject]
            
            // 2.没有错
            backCall(dic: dic, error: nil)
            
        }
    }
  
}