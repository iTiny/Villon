//
//  BaseWebViewController.swift
//  Villon
//
//  Created by Bing on 2017/5/9.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit
import WebKit

class BaseWebViewController: BaseViewController {

    
    var loadUrl:URL?
    
    fileprivate lazy var webView: WKWebView = {
        
        let webview = WKWebView(frame: UIScreen.main.bounds)
        
        
        return webview
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.webView)
        
        // Do any additional setup after loading the view.
    
        
        
    }
    
    
}
