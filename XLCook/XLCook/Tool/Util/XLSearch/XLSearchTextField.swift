//
//  XLSearchTextField.swift
//  XLCook
//
//  Created by Beyondream on 2017/7/24.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import UIKit



@objc protocol XLSearchBarDelegate : class{
    @available(iOS 2.0, *)
    
    func xlSearcbTextFieldShouldBeginEditing(_ textField: UITextField) -> Bool // return NO to disallow editing.
    
    @available(iOS 2.0, *)
    func xlSearcbTextFieldDidBeginEditing(_ textField: UITextField) // became first responder
    
    @available(iOS 2.0, *)
    func xlSearcbTextFieldShouldEndEditing(_ textField: UITextField) -> Bool // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    
    @available(iOS 2.0, *)
    func xlSearcbTextFieldDidEndEditing(_ textField: UITextField) // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    
    @available(iOS 10.0, *)
    func xlSearcbTextFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) // if implemented, called in place of textFieldDidEndEditing:
    
    
    @available(iOS 2.0, *)
    func xlSearcbTextField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool // return NO to not change text
    
    
    @available(iOS 2.0, *)
    func xlSearcbTextFieldShouldClear(_ textField: UITextField) -> Bool // called when clear button pressed. return NO to ignore (no notifications)
    
    @available(iOS 2.0, *)
    func xlSearcbTextFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.

}

class XLSearchTextField: UITextField ,UITextFieldDelegate{
    
    weak var xlSearchDelegate : XLSearchBarDelegate?
    
    weak var searchInputView = UIView()
    
    weak var searchImg = UIImageView()
    
    
    
    var searchPlacehold = "" {
        didSet{
            self.placeholder = searchPlacehold
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
        self.hiddenSearchAnimation()
        
        
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
        let inputView = UIView.init(frame: CGRect (x: 0, y: 0, width: 24, height: 24))
        self.searchInputView = inputView
        
        let imgSearch = UIImageView.init(frame: CGRect(x: 12, y: (inputView.cl_width - 12)/2, width: 12, height: 12))
        imgSearch.image = #imageLiteral(resourceName: "search")
        self.searchImg = imgSearch
        
        self.inputView?.addSubview(self.searchImg!)
        
        self.leftView = self.inputView
        
    }
    
    func hiddenSearchAnimation() -> Void {
        let inputView = UIView.init(frame: CGRect (x: 0, y: 0, width: self.cl_width/2 - 30, height: 24))
        self.searchInputView = inputView
        
        let imgSearch = UIImageView.init(frame: CGRect(x: self.cl_width/2 - 30 - 12, y: (inputView.cl_width - 12)/2, width: 12, height: 12))
        imgSearch.image = #imageLiteral(resourceName: "search")
        self.searchImg = imgSearch
        
        self.inputView?.addSubview(self.searchImg!)
        
        self.leftView = self.inputView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return  (xlSearchDelegate?.xlSearcbTextFieldShouldBeginEditing(textField) != nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        xlSearchDelegate?.xlSearcbTextFieldDidBeginEditing(textField)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return  (xlSearchDelegate?.xlSearcbTextFieldShouldEndEditing(textField))!
    }
    
    @available(iOS 10.0, *)
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        
        xlSearchDelegate?.xlSearcbTextFieldDidEndEditing(textField, reason: reason)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        xlSearchDelegate?.xlSearcbTextFieldDidEndEditing(textField)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return (((xlSearchDelegate?.xlSearcbTextField(_:shouldChangeCharactersIn:replacementString:)) != nil))
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return (xlSearchDelegate?.xlSearcbTextFieldShouldClear(_:) != nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return(xlSearchDelegate?.xlSearcbTextFieldShouldReturn(_:) != nil)
    }
    

}
