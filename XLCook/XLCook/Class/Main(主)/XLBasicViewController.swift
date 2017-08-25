//
//  XLBasicViewController.swift
//  XLKeep
//
//  Created by Beyondream on 2017/7/13.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import UIKit

class XLBasicViewController: UIViewController ,UITextFieldDelegate {
    
    var leftBtn = UIButton()
    var rightBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white

        self.creatNav()
        
    }
    
    
    fileprivate func creatNav() -> Void {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 16), NSForegroundColorAttributeName: UIColor.black]

        
        let leftBtn = UIButton()
        self.leftBtn = leftBtn
        leftBtn.frame = CGRect (x: 0, y: 0, width: 30, height: 30)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBtn)
        
        
        let rightBtn = UIButton()
        self.rightBtn = rightBtn
        rightBtn.frame = CGRect (x: 0, y: 0, width: 30, height: 30)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBtn)
        

    }
    
    public lazy var navBarView :UIView = {
        let navBarView = UIView()
        navBarView.frame = CGRect (x: 0, y: 0, width: Screen_W - 120, height: 30)

        let searchBar = XLSearchTextField.init(frame: CGRect (x: 0, y: 0, width: Screen_W - 120, height: 30))
        searchBar.searchPlacehold = "减肥，就吃这些!"
        searchBar.layer.cornerRadius = 3
        searchBar.clipsToBounds = true
        searchBar.delegate = self
        searchBar.font = UIFont.systemFont(ofSize: 17);
        searchBar.resignFirstResponder()
        searchBar.hiddenSearchAnimation()
        searchBar.backgroundColor = XLLightGray_Color()
        navBarView.addSubview(searchBar)
        return navBarView
        
    }()
    
    
    //searchTF BeginEditing
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        let searchVC = XLSearchViewController()
        searchVC.searchPlaceTitle = "减肥，就吃这些!"
//        searchVC.hotSearches = ["Java", "Python", "Objective-C", "Swift", "C", "C++", "PHP", "C#", "Perl", "Go", "JavaScript", "R", "Ruby", "MATLAB"]
        let searchNav = UINavigationController.init(rootViewController: searchVC)
        searchVC.navigationController?.navigationBar.setBackgroundImage(UIImage.getImageWithColor(color: UIColor.white), for: .default)
        
        searchVC.navigationController?.navigationBar.shadowImage = UIImage.getImageWithColor(color: UIColor.white)
        self.present(searchNav, animated: false, completion: nil)

        return false;
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
