//
//  XLBasicViewController.swift
//  XLKeep
//
//  Created by Beyondream on 2017/7/13.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import UIKit

class XLBasicViewController: UIViewController ,UITextFieldDelegate {

    var coustomNavBar :XLNavigationBarView = XLNavigationBarView()
    
    var leftBtn = UIButton()
    var rightBtn = UIButton()
    var backBtn = UIButton()
    var navTitleLabel = UILabel()
    var searchTF = XLSearchTextField()
    

    var navTitle = "" {
        didSet{
            navTitleLabel.text = navTitle;
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = UIColor.white
        
        self.creatNav()
        
    }
    
    
    fileprivate func creatNav() -> Void {
        coustomNavBar.frame = CGRect (x: 0, y: 0, width: Screen_W, height: NavBar_h)
        self.view.addSubview(coustomNavBar)
        
        
        let titleLable = UILabel()
        self.navTitleLabel = titleLable
        titleLable.frame = CGRect(x: 0, y: 20, width: 200, height: 25);
        titleLable.centerX = self.coustomNavBar.centerX
        titleLable.centerY = self.coustomNavBar.centerY + 7
        titleLable.font = UIFont.systemFont(ofSize: 16);
        titleLable.textAlignment = .center
        self.coustomNavBar.addSubview(titleLable)
        
        let leftBtn = UIButton()
        self.leftBtn = leftBtn
        
        leftBtn.frame = CGRect (x: 10, y: 13, width: 40, height: 40)
        leftBtn.centerY = self.coustomNavBar.centerY
        leftBtn.addTarget(self, action: #selector(leftBtnClick), for: .touchUpInside)
        self.coustomNavBar.addSubview(leftBtn)
        
        
        let backBtn = UIButton()
        self.backBtn = backBtn
        
        backBtn.frame = CGRect (x: 10, y: 13, width: 40, height: 40)
        backBtn.centerY = self.coustomNavBar.centerY
        backBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        self.coustomNavBar.addSubview(backBtn)
        backBtn.isHidden = true
        
     
        
        let searchBar = XLSearchTextField.init(frame: CGRect (x: 60, y: 25, width: Screen_W - 120, height: 30))
        searchBar.searchPlacehold = "减肥，就吃这些!"
        searchBar.layer.cornerRadius = 3
        searchBar.clipsToBounds = true
        searchBar.delegate = self
        searchBar.font = UIFont.systemFont(ofSize: 17);
        self.searchTF = searchBar
        self.searchTF.hiddenSearchAnimation()
        
        self.searchTF.backgroundColor = XLLightGray_Color()

        
        self.coustomNavBar.addSubview(self.searchTF)
   
    }
    
    //searchTF BeginEditing
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        let searchVC = XLSearchViewController()
        searchVC.searchPlaceTitle = "减肥，就吃这些!"
        let searchNav = UINavigationController.init(rootViewController: searchVC)
        searchVC.navigationController?.navigationBar.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.white), for: .default)
        searchVC.navigationController?.navigationBar.shadowImage = UIImage.getImageWithColor(color: UIColor.white)
        self.present(searchNav, animated: false, completion: nil)
        
        /*
        // let hotSeaches : NSMutableArray = ["Java", "Python", "Objective-C", "Swift", "C", "C++", "PHP", "C#", "Perl", "Go", "JavaScript", "R", "Ruby", "MATLAB"];
        
        
         searchVC.searchViewController(withHotSearches: hotSeaches as! [String], searchBarPlaceholder: "减肥，就吃这些") { (searchController:PYSearchViewController, searchBar:UISearchBar, selectString :String) in
         
         }
         .init(hotSearches: hotSeaches as! [String], searchBarPlaceholder: "减肥，就吃这些")
 
        
        let searchVC = PYSearchViewController()
        
        searchVC.hotSearchStyle = .default
        searchVC.searchHistoryStyle = .default;
        searchVC.delegate = self
        
        self.present(UINavigationController.init(rootViewController: searchVC), animated: false, completion: nil)
        */
        return false;
    }
    
    
    func backBtnClick() -> Void {
        leftBtn.isHidden = true
        let vcArr = self.navigationController?.viewControllers;
        if vcArr!.count > 1 {
            self.navigationController!.popViewController(animated: true)
        }else
        {
            backBtn.isHidden = true
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    func leftBtnClick() -> Void {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
