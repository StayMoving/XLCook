//
//  XLSearchSuggestController.swift
//  XLCook
//
//  Created by Beyondream on 2017/7/26.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import UIKit
import Foundation

typealias XLCellSelectedBlock = (IndexPath) ->Void

@objc protocol XLSearchSuggestionViewDataSource : NSObjectProtocol ,UITableViewDataSource {
    
   func searchSuggestionView(_ searchSuggestionView :UITableView ,cellOfRowAt indexPath : IndexPath) -> UITableViewCell
    
   func searchSuggestionView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
   @objc func numberOfSectionsInsearchSuggestionView(_ tableView: UITableView) -> Int
   
   @objc optional func searchSuggestionView(_ searchSuggestionView :UITableView ,heightForRowAt indexPath : IndexPath) -> CGFloat
    
}


class XLSearchSuggestController: UITableViewController{

    weak var dataSource :XLSearchSuggestionViewDataSource? = nil

    var searchSuggestions :NSMutableArray = [String]() as! NSMutableArray
    
    
    var keyboardDidShow :Bool = false
    
    var cellSelectedBlock :XLCellSelectedBlock?
    
    var originalContentInsetWhenKeyboardShow :UIEdgeInsets = .zero
    var originalContentInsetWhenKeyboardHidden :UIEdgeInsets = .zero
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.separatorStyle = .none
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if self.keyboardDidShow {
            self.originalContentInsetWhenKeyboardShow = self.tableView.contentInset
        }else{
        self.originalContentInsetWhenKeyboardHidden = self.tableView.contentInset
        }
        
    }
    
    // MARK: 键盘响应事件
    func keyboardWillShow(_ noti :NSNotification) -> Void {
        self.keyboardDidShow = true
        self.setSearchSuggestions(searchSuggestions:self.searchSuggestions as! Array<String>)
    }
    
    
    func keyboardWillHide(_ noti :NSNotification) -> Void {
        self.keyboardDidShow = false
        self.originalContentInsetWhenKeyboardHidden = UIEdgeInsetsMake(-30, 0, 30, 0)
        self .setSearchSuggestions(searchSuggestions: self.searchSuggestions as! Array<String>)
    }
    
    
    // MARK : setter
    func setSearchSuggestions(searchSuggestions :Array<String>) -> Void {
        self.searchSuggestions = searchSuggestions as! NSMutableArray
        self.tableView.reloadData()
        
        if self.keyboardDidShow && !UIEdgeInsetsEqualToEdgeInsets(self.originalContentInsetWhenKeyboardShow, .zero) && !UIEdgeInsetsEqualToEdgeInsets(self.originalContentInsetWhenKeyboardShow, UIEdgeInsetsMake(-30, 0, 30 - 64, 0)){
            self.tableView.contentInset = self.originalContentInsetWhenKeyboardShow
        }
        else if !self.keyboardDidShow && !UIEdgeInsetsEqualToEdgeInsets(self.originalContentInsetWhenKeyboardShow, .zero) && !UIEdgeInsetsEqualToEdgeInsets(self.originalContentInsetWhenKeyboardShow, UIEdgeInsetsMake(-30, 0, 30 - 64, 0))
        {
            self.tableView.contentInset = self.originalContentInsetWhenKeyboardHidden
        }
        self.tableView.contentOffset = CGPoint (x: 0, y: -self.tableView.contentInset.top)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        if (self.dataSource != nil) {
            return (self.dataSource?.numberOfSectionsInsearchSuggestionView(tableView))!
        }
        
        return 1
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (self.dataSource != nil) {
            
            let numOfCount = self.dataSource?.searchSuggestionView(tableView, numberOfRowsInSection: section)
            
            return numOfCount!
        }
        
        return self.searchSuggestions.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.dataSource != nil {
            let cell = self.dataSource?.searchSuggestionView(tableView, cellOfRowAt: indexPath)
            return cell!
        }
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
        
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "reuseIdentifier")
            cell?.textLabel?.textColor = XLSystemGray_Color()
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell?.backgroundColor = UIColor.clear
            
        }
        cell?.textLabel?.text = self.searchSuggestions[indexPath.row] as? String;
        return cell!
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (self.dataSource != nil){
         return (self.dataSource?.searchSuggestionView!(tableView, heightForRowAt: indexPath))!
        }
        
        return 44
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (self.cellSelectedBlock != nil) {    
            self.cellSelectedBlock!(indexPath)
           
        }
    }

}
