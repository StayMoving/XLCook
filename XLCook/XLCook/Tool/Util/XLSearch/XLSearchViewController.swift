//
//  XLSearchViewController.swift
//  XLCook
//
//  Created by Beyondream on 2017/7/21.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import UIKit

class XLSearchViewController: UIViewController
{
    var navSearchBar = XLSearchTextField()
    
    
    var searchPlaceTitle :String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setUpNavTitleView()
        setUpNavRightItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension XLSearchViewController:UITextFieldDelegate
{
    func setUpNavTitleView() -> Void {
        let searchBar = XLSearchTextField.init(frame: CGRect (x: 0, y: 0, width: Screen_W - 15, height: 30))
        searchBar.layer.cornerRadius = 3
        searchBar.clipsToBounds = true
        searchBar.delegate = self
        searchBar.font = UIFont.systemFont(ofSize: 17);
        searchBar.searchPlacehold = searchPlaceTitle as NSString
        searchBar.becomeFirstResponder()
        self.navigationItem.titleView = searchBar
        
        navSearchBar = searchBar
    }
    
    func setUpNavRightItem() -> Void {
        
        //创建左侧按钮
        let rigBtn = UIButton()
        rigBtn.frame = CGRect (x: 0, y: 0, width: 40, height: 44)
        rigBtn.setTitle("取消", for: .normal)
        rigBtn.setTitle("取消", for: .selected)
        rigBtn.setTitleColor(XLSystemOrange_Color(), for: .normal)
        rigBtn.setTitleColor(XLSystemOrange_Color(), for: .highlighted)
        rigBtn.addTarget(self, action: #selector(cancleClick), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rigBtn)

    }
    
    //取消
    func cancleClick() -> Void {
        self.navSearchBar.resignFirstResponder()
        self.dismiss(animated: false, completion: nil)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
