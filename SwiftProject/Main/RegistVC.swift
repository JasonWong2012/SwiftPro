//
//  RegistVC.swift
//  SwiftProject
//
//  Created by User on 16/6/23.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit


class RegistVC: BaseTableVC{
    
    @IBOutlet weak var phoneTF: UITextField!
    
    @IBOutlet weak var pwdTF: UITextField!
 
    @IBOutlet weak var codeTF: UITextField!
    
    @IBOutlet weak var codeBtn: UIButton!
    
    @IBOutlet weak var registBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registBtn.becomeAngel(K_RedColor)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(RegistVC.tapedTableView))
        tableView.addGestureRecognizer(tap)

        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBarHidden = false
        
    }
    

}


//MARK:事件
extension RegistVC{
    
    
    //MARK : 获取验证码
    @IBAction func codeBtnAction(sender: AnyObject) {
        
        codeBtn.selected  = !codeBtn.selected
    }
    
    //MRRK : 注册
    @IBAction func registAction(sender: AnyObject) {
        
        //退键盘
        view.endEditing(true)
        
        //提示
        if phoneTF.text?.characters.count == 0 || pwdTF.text?.characters.count == 0{
            
            TipTool.showError("请输入完整手机号和密码")
            return
        }
        
        if phoneTF.text?.characters.count != 11 {
            TipTool.showError("请输入正确手机号")
            return
        }
        
        //主界面
        view.window?.rootViewController = Define.Storyboard_InitVC("TabbarVC")
    }
    
    //MARK : 退键盘
    func tapedTableView(){
        
        view.endEditing(true)
    }
}