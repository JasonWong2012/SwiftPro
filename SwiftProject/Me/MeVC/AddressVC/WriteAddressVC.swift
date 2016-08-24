//
//  WriteAddressVC.swift
//  SwiftProject
//
//  Created by User on 16/8/17.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class WriteAddressVC: BaseVC {
    
    typealias ArrBlock = ([String!])->()
    
    var block: ArrBlock?
    
    @IBOutlet weak var provinceLab: UILabel!
    
    @IBOutlet weak var addressTV: UITextView!
    
    @IBOutlet weak var keepBtn: UIButton!
    
   lazy var flag = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addressTV.becomeAngel(K_RedColor)
        keepBtn.becomeAngel(K_RedColor)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapedView))
        view.addGestureRecognizer(tap)
       
       }
 
    func tapedView(){
        
        view.endEditing(true)
    }
    
    
    @IBAction func keepBtnAction(sender: UIButton) {
        
        if addressTV.text.characters.count == 0{
            TipTool.showError("请输入地址信息")
            return
        }
       
        //存地址信息
        self.block?([addressTV.text, flag])
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    
   func keepAddressMsg(function: (arr:[String]) -> Void){
    
    function (arr: [addressTV.text, flag])
    
    }
   
}
