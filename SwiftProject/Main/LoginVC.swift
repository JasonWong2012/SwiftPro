//
//  LoginVC.swift
//  SwiftProject
//
//  Created by User on 16/6/22.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit
//import Alamofire

class LoginVC: BaseTableVC {
   
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var pwdView: UIView!
    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var registBtn: UIButton!
    @IBOutlet weak var forgetPwdBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setDetail()
}
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBarHidden = true
    }
 
}


//MARK:设置细节
extension LoginVC{
    
    func setDetail(){
        
        //1.不能滚动
        tableView.scrollEnabled = false
        
        //2.bgView
        let imv = UIImageView()
        imv.image = UIImage(named: "0225bgImage")
        imv.frame = tableView.bounds
        tableView.backgroundView = imv
        
        //3.圆角
        phoneView.becomeAngel()
        pwdView.becomeAngel()
        loginBtn.becomeAngel()
        
        //4.触摸事件
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapedTableView))
        tableView.addGestureRecognizer(tap)
        
        //5.取出上一次数据
        phoneTF.text = K_Phone
        pwdTF.text = K_Pwd
    }
}

//MARK:事件
extension LoginVC{
    
    //MARK:注册
    @IBAction func registAction(sender: AnyObject) {
        
        let registVC = Define.Storyboard_InitVC("RegistVC")
        navigationController?.pushViewController(registVC, animated: true)
        
    }
    
    //MARK:忘记密码
    @IBAction func forgetPwdAction(sender: AnyObject) {
        
        let forgetPwdVC = Define.Storyboard_InitVC("ForgetPwdVC")
        navigationController?.pushViewController(forgetPwdVC, animated: true)
    }
    
    //MARK:登录
    @IBAction func loginBtnAction(sender: AnyObject) {
        handleLogin()
    }
    
    //Mark:摇一摇
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        handleLogin()
    }
    
    
    
    //MARK:退键盘
    func tapedTableView(){
        
        view.endEditing(true)
        
    }
    
}


//MARK:处理登录
extension LoginVC{
  
    func handleLogin(){
        
        //退下键盘
        view.endEditing(true)
        
        //提示
        if phoneTF.text?.characters.count == 0 || pwdTF.text?.characters.count==0{
            
            TipTool.showError("请输入完整账号和密码")
            return
        }
        
        if phoneTF.text?.characters.count != 11{
            
            TipTool.showError("请输入正确的手机号")
            return
        }
        
        //登录提示
        TipTool.showHud(self.view, text: "登录中...")
        //登录接口
        NetTool.shareNetTool.login(phoneTF.text!, passWord: (pwdTF.text?.md5())!) { (dic) in
            
            TipTool.hidHud(self.view)
            
            if Define.reqSuccess(dic!) == true{
                
                //1.把数据存入沙盒
                let path = dic!["value"]
                let arr = path?.componentsSeparatedByString(",")
                K_Udf.setObject(arr![0], forKey: "uid")
                K_Udf.setObject(arr!.last, forKey: "phone")
                K_Udf.setObject(self.pwdTF.text, forKey: "pwd")
                K_Udf.synchronize()
        
                //2.主界面
                self.view.window?.rootViewController = Define.Storyboard_InitVC("TabbarVC")
                
                //3.音效
                GlobalTool.playSoundWithFileName("loginSucess.wav")
                
            }else{
                
                 let tip : String =   dic!["value"] as! String
                 TipTool.showError(tip)
                
                 GlobalTool.playSoundWithFileName("error.wav")
            }
            
        }
    }
    
}