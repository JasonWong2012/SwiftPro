//
//  WalletVC.swift
//  SwiftProject
//
//  Created by User on 16/7/21.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class WalletVC: BaseTableVC {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
}


extension WalletVC{
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row == 1{
            
            let tixianVC = Define.Storyboard_InitVC("TiXianVC")
            navigationController?.pushViewController(tixianVC, animated: true)
        }else if indexPath.row == 2{
            
            let tradeDetailVC = TradeDetailVC ()
            navigationController?.pushViewController(tradeDetailVC, animated: true)
        }

    }
}