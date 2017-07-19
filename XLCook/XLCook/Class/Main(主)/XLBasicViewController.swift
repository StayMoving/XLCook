//
//  XLBasicViewController.swift
//  XLKeep
//
//  Created by Beyondream on 2017/7/13.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import UIKit

class XLBasicViewController: UIViewController {

    var coustomNavBar :XLNavigationBarView = XLNavigationBarView()
    
    var leftBtn = UIButton()
    var rightBtn = UIButton()
    var backBtn = UIButton()
    var navTitleLabel = UILabel()

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
        titleLable.cl_centerX = self.coustomNavBar.cl_centerX
        titleLable.cl_centerY = self.coustomNavBar.cl_centerY + 7
        titleLable.textColor = XLSystemGray_Color()
        titleLable.font = UIFont.systemFont(ofSize: 15);
        titleLable.textAlignment = .center
        self.coustomNavBar.addSubview(titleLable)
        
        let leftBtn = UIButton()
        self.leftBtn = leftBtn
        
        leftBtn.frame = CGRect (x: 10, y: 7, width: 50, height: 50)
        leftBtn.cl_centerY = self.coustomNavBar.cl_centerY
        leftBtn.addTarget(self, action: #selector(leftBtnClick), for: .touchUpInside)
        self.coustomNavBar.addSubview(leftBtn)
        
        
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
