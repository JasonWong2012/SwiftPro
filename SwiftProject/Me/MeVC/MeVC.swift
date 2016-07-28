//
//  MeVC.swift
//  SwiftProject
//
//  Created by User on 16/6/22.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class MeVC: BaseTableVC {
    
    @IBOutlet weak var iconBtn: UIButton!       //头像
    @IBOutlet weak var teacherLab: UILabel!     //老师名
    @IBOutlet weak var studentCountLab: UILabel!//学生数
    @IBOutlet weak var commentCountLab: UILabel! //好评数
    @IBOutlet weak var courseCountLab: UILabel! //课程数
    
    @IBOutlet weak var moneyLab: UILabel!   //钱包
    @IBOutlet weak var addressLab: UILabel! //授课区域
    @IBOutlet weak var profileLab: UILabel! //个人资料
    @IBOutlet weak var certificateLab: UILabel! //资质认证
    @IBOutlet weak var releaseLab: UILabel! //发布课程
    @IBOutlet weak var subjectLab: UILabel! //授课科目
    @IBOutlet weak var timeLab: UILabel!    //授课时间
    
    @IBOutlet weak var categoryView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        iconBtn.becomeRound()
        addNav()
        getData()
        
        
        
        for littleView in categoryView.subviews{
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(MeVC.tapedLittleView(_:)))
            littleView.addGestureRecognizer(tap)
        }
    }
    
    //头像事件
    @IBAction func iconBtnAction(sender: UIButton) {
        
       let iconVC = Define.Storyboard_InitVC("IconVC")
        navigationController?.pushViewController(iconVC, animated: true)
    }
    
    func tapedLittleView(tap:UITapGestureRecognizer) {
        
        let tag = tap.view!.tag
        
        switch tag {
            
        case 1: //钱包
            
            let walletVC = Define.Storyboard_InitVC("WalletVC")
            navigationController?.pushViewController(walletVC, animated: true)
            
        case 2: //订单
            
            let orderVC = Define.Storyboard_InitVC("OrderVC")
            navigationController?.pushViewController(orderVC, animated: true)
            
        case 3: //帮助
            
            let helpVC = HelpVC ()
            navigationController?.pushViewController(helpVC, animated: true)
            

            
        default:
            print("---")
            
        }
    }

}


//MARK:导航
extension MeVC{
    
    func addNav(){
        
        self.navigationItem.rightBarButtonItem =  UIBarButtonItem.init(image: UIImage(named: "0226set.png"), style: UIBarButtonItemStyle.Plain, target: self, action: #selector(setAction))
    }
    
    //MARK : 设置事件
    func setAction(){
        
       let setVC = Define.Storyboard_InitVC("SetVC")
        navigationController?.pushViewController(setVC, animated: true)
    }
}


//MARK:数据
extension MeVC{

    func getData(){
        
        NetTool.shareNetTool.getUserDetailWithType("21") { (dic) in
            
            if Define.reqSuccess(dic!) == true{
                
                //无数据
                if dic!["value"]?.count == 0{
                    return
                }
                
                //取出数据转为字典
                let obj = dic!["value"]?.firstObject as! [String : AnyObject]
                
                let meMod : MeMod = MeMod ()
                meMod.setValuesForKeysWithDictionary(obj)
                
                //设置数据
                self.setData(meMod)
 
            }
        }
    }
    
    //MARK:设置数据
    @objc private func setData(meMod:MeMod){

        //1.头像
        let url = NSURL(string: K_Image_Url + meMod.PhoneLink)
        
        if url != nil {
            let data = NSData(contentsOfURL:url!)
            let image = UIImage(data: data!)
            iconBtn.setImage(image, forState: UIControlState.Normal)
        }
       
        //2.老师名,学生数，好评率，课程数
        teacherLab.text =  meMod.UserName
        
        studentCountLab.text = "学生数：" + meMod.StuCount
        
       let commentP = (meMod.Commpercent == "" ? "0%" :  meMod.Commpercent)
        commentCountLab.text = "好评率：" + commentP
        
        courseCountLab.text =  "课程数：" + meMod.CourseCount
        
        //3.钱包
        moneyLab.text = "余额：" + meMod.Balance
        addressLab.text = meMod.addressDetails
        
        //授课地址是否发布:
        if(meMod.CourseAddress == "yes") {
            
            self.releaseLab.text = "已设置"
            self.releaseLab.textColor = UIColor.lightGrayColor()
        }else{
            self.releaseLab.text = "未设置"
            self.releaseLab.textColor = K_RedColor
        }

        
        //个人资料是否完善：
        if(meMod.detailsOK == "yes"){
            self.profileLab.text = "已完善"
            self.profileLab.textColor = UIColor.lightGrayColor()
        }else{
            self.profileLab.text = "未完善"
            self.profileLab.textColor = K_RedColor
        }
        
        
        //资质是否通过:
        if(meMod.IsApprovalOK == "yes"){
            
            self.certificateLab.text = "已认证"
            self.certificateLab.textColor = UIColor.lightGrayColor()
        }else{
            self.certificateLab.text = "未完善"
            self.certificateLab.textColor = K_RedColor
        }
        
        //是否已发布课程：
        if(meMod.ClassOfTeacherOK == "yes"){
            self.releaseLab.text = "已发布"
            self.releaseLab.textColor = UIColor.lightGrayColor()
        }else{
            self.releaseLab.text = "未发布";
            self.releaseLab.textColor = K_RedColor
        }
        
        //是否设置授课科目:
        if(meMod.ClassCourseOK == "yes") {
            self.subjectLab.text = "已设置"
            self.subjectLab.textColor =  UIColor.lightGrayColor()
        }else{
            self.subjectLab.text = "未设置";
            self.subjectLab.textColor = K_RedColor
        }
        
        //是否发布授课时间:
        if(meMod.ClassTimeOK == "yes"){
            self.timeLab.text = "已设置"
            self.timeLab.textColor = UIColor.lightGrayColor()
        }else{
            self.timeLab.text = "未设置"
            self.timeLab.textColor = K_RedColor
        }

    }
}


extension MeVC{
    
    
}


//MARK:代理方法
extension MeVC{
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return (K_Screen_H - K_NavBar_H - K_BottomBar_H) * 0.4
        }else if indexPath.row == 1{
            return (K_Screen_H - K_NavBar_H - K_BottomBar_H) * 0.6
        }
        
        return 100
    }
}
