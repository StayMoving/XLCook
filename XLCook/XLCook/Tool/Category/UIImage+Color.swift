//
//  UIImage+Color.swift
//  XLCook
//
//  Created by Beyondream on 2017/7/25.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
   class func getImageWithColor(color:UIColor)-> UIImage{
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    
}
