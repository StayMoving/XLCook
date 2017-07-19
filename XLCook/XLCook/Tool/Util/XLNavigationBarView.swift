//
//  XLNavigationBarView.swift
//  XLKeep
//
//  Created by Beyondream on 2017/7/13.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import UIKit

class XLNavigationBarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.titleLabel)
        self.addSubview(self.navLine)
        self.backgroundColor = UIColor.white
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate lazy var titleLabel :UILabel = {
  
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.textColor = NAV_Title_Color()
        titleLabel.font = NAV_Title_Font
        return titleLabel
        
    }()
    
    
    fileprivate lazy var navLine:UILabel = {
        let navLine = UILabel()
        navLine.backgroundColor = UIColor.gray
        return navLine;
    }()
    
    
    override func layoutSubviews() {
        self.titleLabel.frame = CGRect (x: 0, y: 20, width: Screen_W, height: NavBar_h)

        
    }

}
