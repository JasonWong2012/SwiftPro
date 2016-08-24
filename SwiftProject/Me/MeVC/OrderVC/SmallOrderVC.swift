//
//  SmallOrderVC.swift
//  SwiftProject
//
//  Created by User on 16/8/5.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class SmallOrderVC: BaseVC,UITableViewDataSource,UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        //1.属性
        let tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Grouped)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.showsVerticalScrollIndicator = false
        
        //2.注册cell
        Define.Xib_InitCell(tableView, nibName: "OrderCell", cellIdentifie: "OrderCell")
        
        
    }
    
    
 
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID = "OrderCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? OrderCell
        
        if cell == nil {
            cell = OrderCell(style: UITableViewCellStyle.Default, reuseIdentifier: "OrderCell")
        }
        
        return cell!
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 185
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 5
    }

}
