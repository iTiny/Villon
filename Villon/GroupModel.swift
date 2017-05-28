//
//  GroupModel.swift
//  Villon
//
//  Created by Bing on 2017/5/17.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit
import SwiftyJSON

class GroupModel: NSObject {

    var type:String?
    var homeModels:[HomeModel]? = [HomeModel]()
    
    init(jsonArray: [JSON], category: String) {
        super.init()
        self.type = category
        
        for json in jsonArray {
            
            let homeModel = HomeModel(dict: json)
            self.homeModels?.append(homeModel)
            
        }
    }
    
}
