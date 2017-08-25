//
//  XLColorConfig.swift
//  XLKeep
//
//  Created by Beyondream on 2017/7/13.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import UIKit

func NAV_Title_Color() -> UIColor {
    return UIColor.white
}

func Nav_BackGround_Color() -> UIColor{
    return CustomColor(199, g: 52, b: 45, a: 1)
}

//系统内橘色
func XLSystemOrange_Color() -> UIColor
{
    return colorWithRGB(0xF64E40)
}

//系统内灰色
func XLSystemGray_Color() -> UIColor {
    return colorWithRGB(0x494A45);
}

func XLLightGray_Color() -> UIColor {
    return colorWithRGB(0xECECE9);
}




func colorWithRGB(_ rgbValue:NSInteger) -> UIColor {
    return colorWithRGBA(rgbValue, alpha: 1.0)
}

func colorWithRGBA(_ rgbValue:NSInteger , alpha:CGFloat) -> UIColor {
    
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
        green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
          blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
                      alpha: alpha)
}

func randomColor() -> UIColor {
    let red = CGFloat(arc4random()%256)/255.0
    let green = CGFloat(arc4random()%256)/255.0
    let blue = CGFloat(arc4random()%256)/255.0
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
}


// MARK:-配置颜色
func CustomColor(_ r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}


let NAV_Title_Font = UIFont.systemFont(ofSize: 17)

