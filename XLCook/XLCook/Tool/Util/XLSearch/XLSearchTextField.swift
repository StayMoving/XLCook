//
//  XLSearchTextField.swift
//  XLCook
//
//  Created by Beyondream on 2017/7/24.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import UIKit


class XLSearchTextField: UITextField ,UITextFieldDelegate{
    
    var searchInputView = UIView()
    
    var searchImg = UIImageView()
    
    var searchPlaceHoldW :CGFloat = 0.0
    
    var inputW :CGFloat = 24
    var imgSearchW :CGFloat = 12
    var imageSpace :CGFloat = 2

   
    var searchPlacehold :NSString = "" {
        
        didSet{
            self.placeholder = searchPlacehold as String
            self.searchPlaceHoldW = min(NSString.getStringSizeWidth(searchPlacehold, font: UIFont.systemFont(ofSize: 17), maxheigh: 24), self.width - inputW * 2)
            self.hiddenSearchAnimation()
        }
    }

    
    var searchFont: UIFont = UIFont.systemFont(ofSize: 17) {
        didSet{
            self.font = searchFont
        }
    }
    
    var searchTextColor: UIColor = UIColor.black {
        didSet{
            self.textColor = searchTextColor
        }
    }
    
    var searchBoardStyle = UITextBorderStyle.none{
        didSet{
            self.borderStyle = searchBoardStyle
        }
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
        self.backgroundColor = XLLightGray_Color()
        self.tintColor = XLSystemOrange_Color()
        self.addNotification()

    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //************************监听事件************************
    
    func addNotification() -> Void {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: self.window)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: self.window)
    }
    
    func keyboardWillShow() -> Void {
       UIView.animate(withDuration: 4) { 
        self.searchAnimation()
        }
    }
    
    func keyboardWillHide() -> Void {
        UIView.animate(withDuration: 4) {
        self.hiddenSearchAnimation()
        }
    }
    
    //************************动态事件************************
    func searchAnimation() -> Void {
        let inputView = UIView.init(frame: CGRect (x: 0, y: 0, width: inputW + 4, height: inputW))
        self.searchInputView = inputView
        
        let imgSearch = UIImageView.init(frame: CGRect(x: inputW - imgSearchW - imageSpace, y: (inputW - imgSearchW)/2, width: imgSearchW, height: imgSearchW))
        imgSearch.image = UIImage (named: "search")
        self.searchImg = imgSearch
        
        self.searchInputView.addSubview(self.searchImg)
        
        self.leftView = self.searchInputView
        self.leftViewMode = .always
        
    }
    
    func hiddenSearchAnimation() -> Void {
        let inputView = UIView.init(frame: CGRect (x: 0, y: 0, width: (self.width - self.searchPlaceHoldW)/2, height: inputW))
        self.searchInputView = inputView
        
        let imgSearch = UIImageView.init(frame: CGRect(x: (self.width - self.searchPlaceHoldW)/2 - imgSearchW * 3/2, y: (inputW - imgSearchW)/2, width: imgSearchW, height: imgSearchW))
        imgSearch.image = UIImage (named: "search")
        self.searchImg = imgSearch
        
        self.searchInputView.addSubview(self.searchImg)
        
        self.leftView = self.searchInputView
        self.leftViewMode = .always
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    

}
