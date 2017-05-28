//
//  BaseViewController.swift
//  Villon
//
//  Created by Bing on 2016/12/6.
//  Copyright © 2016年 Bing. All rights reserved.
//
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}

import UIKit


class BaseViewController: UIViewController {

    var popClosure:(()->Void)?
    
    //两种导航条样式
    enum BarSyle {
        case blue
        case white
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColorMainBG
        
        setupNav()
        
    }

    
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        
//        
//    }
////
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    
}

extension BaseViewController: UIGestureRecognizerDelegate {
    fileprivate func setupNav(){
        
        if self.navigationController?.viewControllers.count > 1 {
            self.navigationController?.interactivePopGestureRecognizer?.delegate = self
            
            //closure 实现部分
            popClosure = { [unowned self] in
                
                guard let navVC = self.navigationController else { return }
                navVC.popViewController(animated: true)
                
            }
        }
        else {
            
        }
        
        setNavBarStyle()
        
    }
    
    func setNavBarStyle(barstyle: BarSyle = .blue){
        
        var barTintColor: UIColor = UIColor.white
        var titleColor:UIColor = UIColorTextBlack
        var backImgName = "nav_back_blue"
        
        switch barstyle {
        case .blue:
            barTintColor = UIColorMainBlue
            titleColor = UIColor.white
            backImgName = "nav_back"
            
        default:
            break
            
        }
        
        self.navigationController?.navigationBar.barTintColor = barTintColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: titleColor]
        
        if navigationController?.viewControllers.count > 1 {
            
            let img = UIImage(named: backImgName)?.withRenderingMode(.alwaysOriginal)
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: img, style: .plain, target: self, action: #selector(back))

        }
        
        
    }
    
    func back(){
        if self.popClosure != nil {
            self.popClosure!()
        }
    }
}
