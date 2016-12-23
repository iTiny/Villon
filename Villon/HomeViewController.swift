//
//  HomeViewController.swift
//  Villon
//
//  Created by Bing on 2016/12/6.
//  Copyright © 2016年 Bing. All rights reserved.
//

import UIKit
//import Alamofire

class HomeViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createTableView()
    }
    
    
    private func createTableView(){
        
        let tableView = UITableView(frame: self.view.bounds)
        tableView.delegate = self;
        tableView.dataSource = self;
        
        self.view.addSubview(tableView)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        
        return cell!
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10.0
    }
    
}
