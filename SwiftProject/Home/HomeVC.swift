//
//  HomeVC.swift
//  SwiftProject
//
//  Created by User on 16/6/22.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class HomeVC: BaseTableVC {
    
    @IBOutlet weak var homeTopView: HomeTopView!
    @IBOutlet weak var newsLab: UILabel!

     var newsIndex : Int = 0
     var page  = 0
     var timer = NSTimer()
lazy var newsModArr = [HomeNewsMod]()
    
lazy var pageControl : UIPageControl = {
        
        let  pageControl = UIPageControl()
        pageControl.frame = CGRectMake((K_Screen_W-80)*0.5,K_Screen_H*0.3-20, 80, 10)
        pageControl.currentPageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl.numberOfPages = 4
        pageControl.userInteractionEnabled = false
        
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1.添加pagecontrol
        self.tableView.addSubview(pageControl)
        
        //2.定时器
        addTimer()
        
        //3.新闻
        getNewsData()
        
        //4.action
        let tap = UITapGestureRecognizer(target: self, action:#selector(HomeVC.tapedNewsLab(_:)))
        newsLab.addGestureRecognizer(tap)
    }
    
     //MARK:打开定时器
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.timer.valid == false {
            addTimer()
        }
    
    }

    //MARK:离开此页面后停止定时器
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        timer.invalidate()
    }

}

//MARK:定时器
extension HomeVC{
    
    func addTimer(){
        
        timer = NSTimer.init(timeInterval: 2.0, target: self, selector: #selector(HomeVC.nextImage), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSDefaultRunLoopMode)
    }

}
//MARK:下一张图
extension HomeVC{
    
    func nextImage(){
        
        page = page + 1
        
        //回到第一页继续滚动
        if page == pageControl.numberOfPages {
            page = 0
        }
        
        
        // 4.2让scrollView滚动
        let point : CGPoint = CGPointMake( CGFloat(page) * K_Screen_W, 0)//偏移位置
        self.homeTopView.setContentOffset(point, animated: true)
        pageControl.currentPage = page;
        
        //5.依次取出新闻标题
        newsIndex = newsIndex + 1
        
        if (self.newsModArr.count > 0 && (newsIndex < self.newsModArr.count)) {
            
            let newsMod = self.newsModArr[newsIndex]
            self.newsLab.text = newsMod.NewsTitle
            self.newsLab.tag = NSInteger(newsMod.PKID)!
        }else{
            newsIndex = 0 //索引又从0开始
        }
    }
}

//MARK:scrollView代理方法
extension HomeVC{
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
        //1.计算当前页数值
        let page = (scrollView.contentOffset.x + 0.5 * K_Screen_W) / K_Screen_W
        //2.滚动到第几个点
        pageControl.currentPage = Int(page)
    }
}

//MARK:新闻
extension HomeVC{
    
    func getNewsData(){
        
    NetTool.shareNetTool.getNewsData("1", pageSize: "100") { (dic) in
        
        if Define.reqSuccess(dic!) == true{
            
                //无数据
                if dic!["value"]?.count == 0{
                    return
                }
            
            let arr = dic!["value"] as! NSArray
            
            //取出数据转为字典
            for obj in arr {
                
                let newsMod : HomeNewsMod = HomeNewsMod ()
                newsMod.setValuesForKeysWithDictionary(obj as! [String : AnyObject])
                self.newsModArr.append(newsMod)
            }
 
         }
        
        }
    }
}


//MARK:新闻事件
extension HomeVC{
    
    func tapedNewsLab(tap:UITapGestureRecognizer){
        
        if (tap.view!.tag==0) {
            return
        }
        
        let newsLink = "http://m.xuef.com/news/newsdetails.html?isHide=yes&newsID=\(tap.view!.tag)"
        let newsVC = NewsVC ()
        newsVC.newsLink = newsLink
        navigationController?.pushViewController(newsVC, animated: true)
    }
}

//MARK:代理方法
extension HomeVC{
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            
            return K_Screen_H * 0.3
        }else if indexPath.row == 1{
            return 50
        }else if indexPath.row == 2{
            return 1257
        }
        
        return 100
    }
}