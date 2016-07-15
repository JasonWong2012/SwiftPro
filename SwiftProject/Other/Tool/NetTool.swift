//
//  NetTool.swift
//  SwiftProject
//
//  Created by User on 16/6/24.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit
//import AFNetworking
import Alamofire

class NetTool: NSObject {
    
    //单例对象
    static let shareNetTool: NetTool = NetTool ()
    
//   let mgr = AFHTTPSessionManager ()
 

    func login(loginName:String,passWord:String,backCall: (dic:[String:AnyObject]?) ->Void){
        
     
       let path = K_Net_1 + "action=login&loginName=\(loginName)&passWord=\(passWord)"
        
       get(path) { (dic, error) in
            
            backCall(dic: dic)
        
        }
        
    }
    
   
    
    //MARK: 最底层的get请求
    func get(path:String , backCall: (dic : [String : AnyObject]?,error : NSError?) ->()){
        
        
        let currentDate = NSDate()
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let dateStr = dateFormatter.stringFromDate(currentDate)
        
        let str = dateStr.stringByAppendingString("QceduXueF@%&*(!~)^$?.").md5().uppercaseString
        let md5Url = path + "&VerSafe=" + str
       let securityStr = md5Url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
        
 
        
//        mgr.GET(securityStr!, parameters: nil, success: { (_, JSON) in
//            
//            if (JSON != nil) {
//                
//                let obj = JSON as! [String : AnyObject]
//                backCall(dic: obj, error: nil)
//            }
//            
//            }) { (_, error) in
//                
//              backCall(dic: nil, error: error)
//        }
        
        // 2.发送请求
//        request(.GET, securityStr!, parameters:nil).responseJSON { (response) -> Void in
//            
//            // 1.判断是否请求成功
//            if response.result.isFailure
//            {
//                backCall(dic: nil,error:response.result.error )
//                return
//            }
//            
//            let dic = response.result.value as? [String: AnyObject]
//            
//            print(response)
//            
//            // 2.没有错
//            backCall(dic: dic, error: nil)
//            
//        }
    
        Alamofire.request(.GET, securityStr!, parameters: nil, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) in
        
            
                    if response.result.isFailure
                        {
                            backCall(dic: nil,error:response.result.error )
                            return
                        }
            
                        let dic = response.result.value as? [String: AnyObject]
            
                        // 2.没有错
                        backCall(dic: dic, error: nil)
        
        }
    }
}


