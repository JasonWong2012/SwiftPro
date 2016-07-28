//
//  TiXianVC.swift
//  SwiftProject
//
//  Created by User on 16/7/25.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit
class TiXianVC: BaseTableVC {
    
 
    
    @IBOutlet weak var moneyTF: UITextField!
    
    @IBOutlet weak var ruleLab: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

 ruleLab.text = "1.请保持银行卡真实姓名与用户真实姓名一致\n2.提现申请成功后，我们将尽快审核并提现到您的账号，预计5-7个工作日到账\n3.如果您提交的账号有误，提现款项将原路返回！"
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(TiXianVC.tapedView))
        self.view.addGestureRecognizer(tap)
    }

    
    @IBAction func tixianBtnAction(sender: AnyObject) {
        
                if moneyTF.text?.characters.count == 0{
                    TipTool.showError("请输入金额")
                    return
                }
        
                TipTool.showSuccess("提现成功")
             navigationController?.popViewControllerAnimated(true)
    }
 
    
    func tapedView() {
        
        self.view.endEditing(true)
    }
}
