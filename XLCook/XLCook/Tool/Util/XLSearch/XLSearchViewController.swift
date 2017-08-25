//
//  XLSearchViewController.swift
//  XLCook
//
//  Created by Beyondream on 2017/7/21.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import UIKit


public enum XLSearchStyle : NSInteger{
    case XLSearchStyleNormal = 0
    case XLHotSearchStyleColorful = 1
    case XLHotSearchStyleBorder = 2
    case XLHotSearchStyleARC = 3
    case XLHotSearchStyleRankTag = 4
    case XLHotSearchStyleRectangleTag = 5
    case XLHotSearchStyleDefault = 6
}

public enum XLSearchResultShowMode : NSInteger{
    case XLSearchResultShowModeCustom = 0
    case XLSearchResultShowModePush = 1
    case XLSearchResultShowModeEmbed = 2
    case XLSearchResultShowModeDefault = 3

}


class XLSearchViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource ,UITextFieldDelegate{

    var hotSearchStyle = XLSearchStyle (rawValue:6)
    var historyStyle = XLSearchStyle (rawValue:6)
    var searchResultMode = XLSearchResultShowMode (rawValue: 3)
    var searchSuggestionHidden = false
    var searchHistoriesCount = 20
    var showSearchHistory = true
    var showHotSearch = true
    var showSearchResultWhenSearchTextChanged = false
    var showSearchResultWhenSearchBarRefocused = false
    var removeSpaceOnSearchString = true
    

    //var searchBar = UISearchBar();
    var searchBar = XLSearchTextField()
    
    var searchPlaceTitle = "" {
    didSet
     {
        searchBar.placeholder = searchPlaceTitle
      }
    }
    
    
    
    //fileprivate lazy var
    
    fileprivate lazy var baseTableView :UITableView  = {
    
        let tableView = UITableView (frame: self.view.bounds, style: .grouped)
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        return tableView
    }()
    //fileprivate lazy
     var searchHistories :NSMutableArray = {
       let searchArr = NSMutableArray.init(array: [NSKeyedUnarchiver.unarchiveObject(withFile: XLSearch_historyPath as String) ?? []])
        return searchArr
    
    }()
    
    
    override var prefersStatusBarHidden: Bool{
        return false
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUp();
    }
    

    //tableView 代理
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.baseTableView.tableFooterView?.isHidden = 0 == self.searchHistories.count || !self.showSearchHistory
        return self.showSearchHistory ?self.searchHistories.count : 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "searchHhistoryCellID"
        var cell  = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: cellID)
            cell?.textLabel?.textColor = XLLightGray_Color()
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell?.backgroundColor = UIColor.clear
        }
        
        return cell!
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        self.searchBar.resignFirstResponder()
    }
    
    
    //创建试图
    
    func setUp(){
        self.view.backgroundColor = UIColor.white
        self.baseTableView.separatorStyle = .none
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: self.creatRightBtn())

        
        let searchBar = XLSearchTextField.init(frame: CGRect (x: 10 - Screen_W/2, y: -17, width: Screen_W - 20 - 50, height: 34))
        searchBar.searchPlacehold = "减肥，就吃这些!"
        searchBar.becomeFirstResponder()
        searchBar.delegate = self
        self.searchBar = searchBar

        
        let titleView = UIView.init();
        titleView.isUserInteractionEnabled = true
        titleView.backgroundColor = UIColor.clear
        titleView.addSubview(searchBar)
        
        self.navigationItem.titleView = titleView;

        
        
    }

    //创建左侧按钮
    func creatRightBtn() -> UIButton {
        let rigBtn = UIButton()
        rigBtn.frame = CGRect (x: 0, y: 0, width: 50, height: 44)
        rigBtn.setTitle("取消", for: .normal)
        rigBtn.setTitle("取消", for: .selected)
        rigBtn.setTitleColor(XLSystemOrange_Color(), for: .normal)
        rigBtn.setTitleColor(XLSystemOrange_Color(), for: .selected)
        rigBtn.titleEdgeInsets = UIEdgeInsets (top: 0, left: 10, bottom: 0, right: -10)
        rigBtn.addTarget(self, action: #selector(cancleClick), for: .touchUpInside)
        return rigBtn
        
    }
    
    //取消
    func cancleClick() -> Void {
        self.searchBar.resignFirstResponder()
        self.dismiss(animated: false, completion: nil)
    }
    
    //键盘出现
    func keyboardDidShow() -> Void {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
