//
//  HomeViewController.swift
//  Villon
//
//  Created by Bing on 2017/5/9.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit
import Moya
import Alamofire
import SwiftyJSON
import Kingfisher

class HomeViewController: BaseViewController {

    var groupModels:[GroupModel] = [GroupModel]()
    
    
    
    fileprivate lazy var headerView: UIImageView = {
        let headerView = UIImageView(frame: CGRect(x: 0, y: 0, width: kWinSize.width, height: kWinSize.width*0.5))
        
        headerView.contentMode = UIViewContentMode.scaleAspectFill
        headerView.clipsToBounds = true
        
        return headerView
    }()
    
    lazy var tableView:UITableView = {
    
        let tableView = UITableView(frame: CGRect(x:0,y:0,width:kWinSize.width,height:kWinSize.height-49.0), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = self.headerView
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle:nil), forCellReuseIdentifier: "HomeTableViewCell")

        
//        tableView.register(UINib(nibName: NSStringFromClass(HomeTableViewCell.self), bundle: Bundle.main), forCellReuseIdentifier: NSStringFromClass(HomeTableViewCell.self))
        
        
        return tableView
    
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.tableView)
        self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
        requestDateList()
        
    }
    
    func loadGanksWithDate(date:String) {
        
        
        GankAPIProvider.request(GankAPI.dateNews(date)) { (result) in
            
            do{
                let response = try result.dematerialize()
                
                let jsonDic = JSON(response.data).dictionaryValue
                
                
////                print(jsonDic)
                let categorys = (jsonDic["category"]?.arrayValue)!
                let result = jsonDic["results"]?.dictionaryValue
                

                for category in categorys {
                    
                    let gropJsons = result![category.stringValue]?.arrayValue
                    
                    let groupModel = GroupModel(jsonArray: gropJsons!, category: category.stringValue)
                    
                    self.groupModels.append(groupModel)
                    
                }
                //http://ww1.sinaimg.cn/large/610dc034ly1ffmwnrkv1hj20ku0q1wfu.jpg
                self.headerView.kf.setImage(with: URL(string: "http://ww1.sinaimg.cn/large/610dc034ly1ffmwnrkv1hj20ku0q1wfu.jpg"))
                
                
                self.tableView.reloadData()
                
                //
//                for type in category {
//                    
//                    let jsons = result[type.stringValue]?.arrayValue
//                    
//                    for jsonDic in jsons! {
//                        
//                        let  homeModel:HomeModel = HomeModel(dict: jsonDic)
//                        self.homeModels.append(homeModel)
//                        
//                    }
//                    
//                    
//                }
//                
//                print(self.homeModels)
//                self.tableView.reloadData()
                

            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func requestDateList(){
        
        GankAPIProvider.request(GankAPI.history) { result in
            
            do {
                
                let response = try result.dematerialize()
                let any = try response.mapJSON()
                
                let dict = any as? NSDictionary
                guard let dates:[String] = dict?["results"] as? [String] else {
                    
                    return
                }
                let dateStr:String = dates.first!
                let date = dateStr.replacingOccurrences(of: "-", with: "/")
                
                self.loadGanksWithDate(date: date)
                
                
            }catch {
            
                print(error.localizedDescription)
            }
            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension HomeViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.groupModels[section].homeModels?.count)!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.groupModels.count
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let homeCell:HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HomeTableViewCell.self)) as! HomeTableViewCell

        let homeCell:HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell") as! HomeTableViewCell
        
//        if homeCell == nil {
//            homeCell = Bundle.main.loadNibNamed(NSStringFromClass(HomeTableViewCell.self), owner: self, options: nil)?.first as! HomeTableViewCell
//        }
        
        let homeModel = self.groupModels[indexPath.section].homeModels?[indexPath.row]
        homeCell.nameLabel.text = homeModel?.who
        homeCell.contentlabel.text = homeModel?.desc
        homeCell.datelabel.text = homeModel?.publishedAt
        
        return homeCell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.groupModels[section].type
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let webviewVC = BaseViewController()
        webviewVC.hidesBottomBarWhenPushed = true
        
        self.navigationController?.pushViewController(webviewVC, animated: true)
        
    }

    
}
