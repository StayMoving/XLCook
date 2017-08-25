//
//  UIView+Frame.swift
//  CLKuGou_Swift
//
//  Created by Darren on 16/8/6.
//  Copyright © 2016年 darren. All rights reserved.
//
import UIKit

extension UIView {
    
    /// 裁剪 view 的圆角
    func clipRectCorner(_ direction: UIRectCorner, cornerRadius: CGFloat) {
        let cornerSize = CGSize(width: cornerRadius, height: cornerRadius)
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.addSublayer(maskLayer)
        layer.mask = maskLayer
    }
    
   /// 设置view圆角
//    func CLViewsBorder(view:UIView, borderWidth:CGFloat, borderColor:UIColor,cornerRadius:CGFloat){
//        view.layer.borderWidth = 1;
//        view.layer.borderColor = borderColor.CGColor
//        view.layer.cornerRadius = cornerRadius
//    }
    
    /// x
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.x    = newValue
            frame                 = tempFrame
        }
    }
    
    /// y
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.origin.y    = newValue
            frame                 = tempFrame
        }
    }
    
    /// height
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame                 = tempFrame
        }
    }
    
    /// width
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    /// size
    var size: CGSize {
        get {
            return frame.size
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    /// centerX
    var centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    /// centerY
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.y = newValue
            center = tempCenter;
        }
    }
    
    var maxX :CGFloat {
    
        get{
          return frame.origin.x + frame.size.width
        }
        set(newValue){
            var tempFrame: CGRect = frame
            tempFrame.origin.x    = newValue - frame.size.width
            frame                 = tempFrame
            
        }
    
    }
    
    var maxY :CGFloat {
        
        get{
            return frame.origin.y + frame.size.height
        }
        set(newValue){
            var tempFrame: CGRect = frame
            tempFrame.origin.y    = newValue - frame.size.height
            frame                 = tempFrame
            
        }
        
    }
    
    
}
