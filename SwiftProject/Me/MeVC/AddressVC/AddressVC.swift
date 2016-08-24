//
//  AddressVC.swift
//  SwiftProject
//
//  Created by User on 16/8/15.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class AddressVC: BaseTableVC {
    
    @IBOutlet weak var provinceLab: UILabel!
    @IBOutlet weak var cityLab: UILabel!
    @IBOutlet weak var areaLab: UILabel!
    @IBOutlet weak var streetLab: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        K_NotiCenter.addObserver(self, selector: #selector(receiveAddressInfoNoti(_:)), name: "addressInfo", object: nil)
        
    }
    
    
    //MARK:选中cell
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let writeAddressVC = Define.Storyboard_InitVC("WriteAddressVC") as! WriteAddressVC
        
        
        writeAddressVC.block = { arr in
            
            let flag = arr[1]
            let text = arr[0]
            
            weak var weakSelf = self
            if flag == "省" {
                weakSelf!.provinceLab.text = text
            }else if flag == "市" {
                 weakSelf!.cityLab.text = text
            }else if flag == "区" {
                 weakSelf!.areaLab.text = text
            }else if flag == "街道" {
                 weakSelf!.streetLab.text = text
            }

        }
        
        if indexPath.section == 0 {
            writeAddressVC.flag = "省"
        }else if indexPath.section == 1 {
          writeAddressVC.flag = "市"
        }else if indexPath.section == 2 {
            writeAddressVC.flag = "区"
        }else if indexPath.section == 3 {
            writeAddressVC.flag = "街道"
        }
        
     navigationController?.pushViewController(writeAddressVC, animated: true)

    }
     
    
}
