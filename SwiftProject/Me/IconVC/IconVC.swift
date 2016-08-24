//
//  IconVC.swift
//  SwiftProject
//
//  Created by User on 16/7/25.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit



class IconVC: BaseTableVC,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate{

     var icon = UIImage ()
    
    @IBOutlet weak var iconImv: UIImageView!
    
    @IBOutlet weak var keepBtn: UIButton!
  
    
    lazy var actionSheet : UIActionSheet = {
        
        let sheet = UIActionSheet (title: nil, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: "拍照", otherButtonTitles: "从相册选中")
        
        return sheet
        
    }()
    
    lazy var picker:UIImagePickerController = {
        
        let pic = UIImagePickerController ()
        pic.delegate = self
        pic.allowsEditing = true
        
        return pic
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
  
            iconImv.image = icon
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBarHidden = true
      
    }
    
    //MARK:隐藏状态栏
   override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
   override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            return K_Screen_W
        }
        return 50
    }
}


extension IconVC{
    
    //MARK:更换头像
    @IBAction func changeIconAction(sender: UIButton) {
        
        actionSheet.showInView(K_Window!)

    }
    //MARK:保存头像
    @IBAction func keepBtnAction(sender: UIButton) {
        TipTool.showSuccess("保存成功")
        navigationController?.popViewControllerAnimated(true)
    }
    
    //MARK:取消头像
    @IBAction func cancleBtnAction(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    //MARK:点击了哪个
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        
        if buttonIndex == 0 {      //拍照
            
        picker.sourceType = UIImagePickerControllerSourceType.Camera
        presentViewController(picker, animated: true) { }
            
        }else if buttonIndex == 1 { //取消
          
            actionSheet.removeFromSuperview()
            
        }else{     //相册
            
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(picker, animated: true) { }
        }
    }
    

    //MARK:代理方法 - 选中图片
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        //压缩存入沙盒
//        let imageData = UIImageJPEGRepresentation(image, 0.01)
//        K_Udf.setObject(imageData, forKey: "icon")
//        K_Udf.synchronize()
        keepBtn.enabled = true
        keepBtn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        K_NotiCenter.postNotificationName("changeIconNoti", object: image)
        
        //显示图片
        iconImv.image = image
        dismissViewControllerAnimated(true) {}
    }
    
}