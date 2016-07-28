//
//  HelpVC.swift
//  SwiftProject
//
//  Created by User on 16/7/22.
//  Copyright © 2016年 XFW. All rights reserved.
//

import UIKit

class HelpVC: BaseVC,UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "帮助"
        
        let webView = UIWebView ()
        self.view.addSubview(webView)
        webView.frame = CGRectMake(0, K_NavBar_H, K_Screen_W, K_Screen_H-K_NavBar_H);
        let url = NSURL(string: "http://m.xuef.com/help/help_list.html?isHide=ok")
        let requst = NSURLRequest(URL: url!)
        webView.scalesPageToFit = true
        webView.delegate = self
        webView.loadRequest(requst)
        
 }
}

//MARK:代理方法
extension HelpVC{
    
    func webViewDidStartLoad(webView: UIWebView) {
        
        TipTool.showHud(view, text: "正在加载...")
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        TipTool.hidHud(view)
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
       
        
        let urlStr = request.URL?.absoluteString
        
        if ((urlStr?.containsString("help_list.html")) == true){
            self.navigationController?.navigationBarHidden = false
        }else{
          self.navigationController?.navigationBarHidden = true
        }
        
        return true
        
    }
}