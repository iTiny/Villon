//
//  HomeModel.swift
//  Villon
//
//  Created by Bing on 2017/5/16.
//  Copyright © 2017年 Bing. All rights reserved.
//

import UIKit
import SwiftyJSON
class HomeModel: NSObject {
    
    var id: String?
    var who: String?
    var publishedAt: String?
    var type: String?
    var desc: String?
    var url: String?
    
    init(dict: JSON) {
        super.init()
        
        for (index, value) in dict {
            
            switch index {
            case "_id":
                self.id = value.string
            case "who":
                self.who = value.string
            case "publishedAt":
                self.publishedAt = value.string
            case "type":
                self.type = value.string
            case "desc":
                self.desc = value.string
            case "url":
                self.url = value.string
                
            default: break
                
            }
            
        }
        
    }
   
}
