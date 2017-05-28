//
//  GankViewViewController.swift
//  Villon
//
//  Created by Bing on 2017/5/9.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit
import WeexSDK

class GankViewViewController: BaseViewController {

    let instance:WXSDKInstance = WXSDKInstance()
    var weexView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        instance.viewController = self
        instance.frame = self.view.frame
//        instance.frame = CGRect(x: 0, y: 0, width: kWinSize.width, height: kWinSize.height - 64.0 - 49.0)
        
        instance.onCreate = { [unowned self] (view) in
            
            self.weexView?.removeFromSuperview()
            self.weexView = view
            
            self.view.addSubview(self.weexView!)
            
            
            UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self.weexView)
            
        }
        
        instance.onFailed = {(error) in
            
        }
        
        instance.renderFinish = {(view) in
            
        }
        
        let url = Bundle.main.url(forResource: "index", withExtension: "js")!
        instance.render(with: url, options: ["index":url.absoluteString], data: nil)
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    deinit {
        
        instance.destroy()
    }
    
}
