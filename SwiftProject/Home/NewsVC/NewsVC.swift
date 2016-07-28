//
//  NewsVC.swift
//  SwiftProject
//
//  Created by User on 16/7/21.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class NewsVC: BaseVC,UIWebViewDelegate {
    
    var newsLink = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "学富新闻"
        
        let webView = UIWebView ()
        self.view.addSubview(webView)
        webView.frame = CGRectMake(0, K_NavBar_H, K_Screen_W, K_Screen_H-K_NavBar_H);
        let url = NSURL(string: newsLink)
        let requst = NSURLRequest(URL: url!)
        webView.scalesPageToFit = true
        webView.delegate = self
        webView.loadRequest(requst)
    }

}

//MARK:代理方法
extension NewsVC{
    
    func webViewDidStartLoad(webView: UIWebView) {
        
        TipTool.showHud(view, text: "正在加载...")
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        TipTool.hidHud(view)
    }
}