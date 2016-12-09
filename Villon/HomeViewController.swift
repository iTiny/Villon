//
//  HomeViewController.swift
//  Villon
//
//  Created by Bing on 2016/12/6.
//  Copyright © 2016年 Bing. All rights reserved.
//

import UIKit

struct Fahrenheit {
    
}

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createTestButton()
        
    }
    
    
    private func createTestButton() {
        
        
        
        let btn = UIButton(type: UIButtonType.custom)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        btn.setTitle("test", for: UIControlState.normal)
        btn.backgroundColor = UIColor.orange
        btn.addTarget(self, action: #selector(btnClick(sender:)), for: UIControlEvents.touchUpInside)
        
        self.view.addSubview(btn)
        
    }
    
    @objc func btnClick(sender:UIButton){
        
        let testVC :TestViewController = TestViewController()
        
        self.navigationController?.pushViewController(testVC, animated: true);
        
    }
    
}
