//
//  NSString+Float.swift
//  XLCook
//
//  Created by Beyondream on 2017/7/25.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import Foundation
import UIKit

extension NSString{

    /// 计算文字高度
    ///
    /// - Parameters:
    ///   - font: 字体大小
    ///   - maxSize: 最大尺寸
    /// - Returns: 当前尺寸
  class func getStringSize(_ string : NSString , font :UIFont ,maxSize : CGSize) -> CGSize {
        let attributes : NSDictionary = [NSFontAttributeName:font]
        
        return string.boundingRect(with: maxSize, options:.usesLineFragmentOrigin, attributes: attributes as? [String : Any], context: nil).size
    }
    
    
    /// 根据最大高度获取长度
    ///
    /// - Parameters:
    ///   - string: 文字
    ///   - font: 最大尺寸
    ///   - maxheigh: 最大高度
    /// - Returns: 宽度
   class func getStringSizeWidth(_ string : NSString , font :UIFont ,maxheigh: CGFloat) -> CGFloat {
        let attributes : NSDictionary = [NSFontAttributeName:font]
        
        return string.boundingRect(with: CGSize (width: CGFloat(MAXFLOAT), height: maxheigh), options:.usesLineFragmentOrigin, attributes: attributes as? [String : Any], context: nil).size.width
    }
    
    
    /// 根据最大长度获取高度
    ///
    /// - Parameters:
    ///   - string: 文字
    ///   - font: 字体
    ///   - maxWidth: 最大宽度
    /// - Returns: 高度
    class func getStringSizeHeigh(_ string : NSString , font :UIFont ,maxWidth: CGFloat) -> CGFloat {
        let attributes : NSDictionary = [NSFontAttributeName:font]
        
        return string.boundingRect(with: CGSize (width: maxWidth , height: CGFloat(MAXFLOAT)), options:.usesLineFragmentOrigin, attributes: attributes as? [String : Any], context: nil).size.width
    }
    

}
