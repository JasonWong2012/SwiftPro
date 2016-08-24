//
//  TradeDetailVC.swift
//  SwiftProject
//
//  Created by User on 16/7/26.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit


class TradeDetailVC: BaseVC,UITableViewDataSource,UITableViewDelegate{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "交易记录"
        
        //tableView
        let tableView = UITableView(frame: CGRectMake(0, K_NavBar_H, K_Screen_W, K_Screen_H-K_NavBar_H), style: UITableViewStyle.Grouped) 
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
       
        //注册cell
       Define.Xib_InitCell(tableView, nibName: "TradeDetailCell", cellIdentifie: "TradeDetailCell")
    }

}

extension TradeDetailVC{
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID = "TradeDetailCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? TradeDetailCell
        
        if cell == nil {
            cell = TradeDetailCell(style: UITableViewCellStyle.Default, reuseIdentifier: "TradeDetailCell")
        }
      
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
}
