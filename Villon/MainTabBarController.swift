//
//  MainTabBarController.swift
//  Villon
//
//  Created by Bing on 2017/5/9.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    
    lazy var homeVC: UINavigationController = {
        
        return self.createNav(HomeViewController(), title: "首页", tabBarItemTitle: "首页", normalImg: #imageLiteral(resourceName: "tabbar_home"), selectedImg: #imageLiteral(resourceName: "tabbar_home_highlighted"))
        
    }()
    
    lazy var gankVC: UINavigationController = {
        
        return self.createNav(GankViewViewController(), title: "干货", tabBarItemTitle: "干货", normalImg: #imageLiteral(resourceName: "find"), selectedImg: #imageLiteral(resourceName: "find_select"))
        
    }()
    
    lazy var mineVC: UINavigationController = {
        
       return self.createNav(MineViewController(), title: "我的", tabBarItemTitle: "我的", normalImg: #imageLiteral(resourceName: "property"), selectedImg: #imageLiteral(resourceName: "property_select"))
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViewControllers()
        
    }

    private func setupViewControllers(){
        
//        let itemImgs:[UIImage] = [#imageLiteral(resourceName: "tabbar_home"),#imageLiteral(resourceName: "find"),#imageLiteral(resourceName: "property")]
//        let itemSelectedimgs:[UIImage] = [#imageLiteral(resourceName: "tabbar_home_highlighted"),#imageLiteral(resourceName: "find_select"),#imageLiteral(resourceName: "property_select")];
//        let titles:[String] = ["首页","干货","我的"]
//        
//        let viewControllers:[BaseViewController] = [HomeViewController(), GankViewViewController(), MineViewController()]
//        
//        for (index, vc) in viewControllers.enumerated() {
//            
//            let img = itemImgs[index]
//            let img_selected = itemSelectedimgs[index]
//            let title = titles[index]
//            
//            vc.tabBarItem.title = title
//            vc.tabBarItem.selectedImage = img_selected
//            vc.tabBarItem.image = img
//            
//        }
//        self.setViewControllers(viewControllers, animated: true)
        
        self.setViewControllers([homeVC,gankVC,mineVC], animated: false)
        
        self.tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage(named: "tabBar_bgwhiteColor")
        
        tabBar.tintColor = UIColorMainBlue

    }
    
    private func createNav(_ vc: BaseViewController, title: String, tabBarItemTitle: String, normalImg: UIImage, selectedImg: UIImage) -> UINavigationController {
        
        vc.navigationItem.title = title
        vc.tabBarItem.title = tabBarItemTitle
        vc.tabBarItem.selectedImage = selectedImg
        vc.tabBarItem.image = normalImg
        
        
        let nav = UINavigationController(rootViewController: vc)
        return nav
        
    }

}
