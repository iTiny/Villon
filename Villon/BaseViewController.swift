//
//  BaseViewController.swift
//  Villon
//
//  Created by Bing on 2016/12/6.
//  Copyright © 2016年 Bing. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.hexInt(hexValue: 0xf0f0f0)
        
    }
    
    final func staticFunc(){
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
