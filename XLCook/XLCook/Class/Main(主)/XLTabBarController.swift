//
//  XLTabBarController.swift
//  XLKeep
//
//  Created by Beyondream on 2017/7/13.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import UIKit


class XLTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpChildView();
        

    }
    
    //子控制器
    
   fileprivate func setUpChildView() -> Void {
       
        let cookVC = XLCookController()
        self.addChildController(cookVC, title: "下厨房", image: "tabADeselected~iphone", selectedImage: "tabASelected~iphone")
        
        let fairVC = XLFairController()
        self.addChildController(fairVC, title: "市集", image: "tabBDeselected~iphone", selectedImage: "tabBSelected~iphone")
        
        let collectVC = XLCollectController()
        self.addChildController(collectVC, title: "收藏", image: "tabCDeselected~iphone", selectedImage: "tabCSelected~iphone")
        
        let msgVC = XLMsgController()
        self.addChildController(msgVC, title: "信箱", image: "tabDDeselected~iphone", selectedImage: "tabDSelected~iphone")
        
        let mineVC = XLMineController()
        self.addChildController(mineVC, title: "我", image: "tabEDeselected~iphone", selectedImage: "tabESelected~iphone")
        
        
    }
    
    //公共方法
    
   fileprivate func addChildController(_ viewController:UIViewController , title:NSString , image:String , selectedImage:String) -> Void {
        
        viewController.tabBarController?.tabBar.backgroundColor = UIColor.white;
        viewController.tabBarItem.title = title as String
        viewController.tabBarItem.image = UIImage(named : image)
        viewController.tabBarItem.selectedImage = UIImage(named :selectedImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        viewController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : XLSystemGray_Color()], for: .normal)
        viewController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName :XLSystemOrange_Color()], for: .selected)

        self.addChildViewController(XLNavigationController.init(rootViewController: viewController))
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
