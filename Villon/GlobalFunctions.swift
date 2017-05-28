//
//  GlobalFunctions.swift
//  Villon
//
//  Created by Bing on 2017/5/9.
//  Copyright © 2017年 Bing. All rights reserved.
////
/*
 
 http://gank.io/api/day/history
 http://gank.io/api/day/2017/05/10
 
 */

import Foundation
import UIKit


func HexColor(_ hexValue: Int) -> UIColor {
    
    return UIColor(red: ((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0,
                   
                   green: ((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0,
                   
                   blue: ((CGFloat)(hexValue & 0xFF)) / 255.0,
                   
                   alpha: 1.0)
}

func RGBColor(r:CGFloat, g:CGFloat, b:CGFloat , alpha: CGFloat) -> UIColor {
    
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    
}



