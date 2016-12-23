//
//  VLExtensions.swift
//  Villon
//
//  Created by Bing on 2016/12/7.
//  Copyright © 2016年 Bing. All rights reserved.
//

import Foundation

extension UIColor {
    class func hexInt(hexValue: Int) -> UIColor {
        return UIColor(red: ((CGFloat)(hexValue & 0xff0000 >> 16)) / 255.0,
                       green: ((CGFloat)(hexValue & 0xff00 >> 8)) / 255.0,
                       blue: ((CGFloat)(hexValue & 0xff)) / 255.0,
                       alpha: 1.0)
        
    }
}

extension UIView {
    
}
