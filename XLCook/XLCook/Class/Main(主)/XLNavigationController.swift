//
//  XLNavigationController.swift
//  XLCook
//
//  Created by Beyondream on 2017/8/25.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import UIKit

class XLNavigationController: UINavigationController ,UINavigationControllerDelegate{

    var backBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        // Do any additional setup after loading the view.
        
        let backBtn = UIButton()
        self.backBtn = backBtn
        
        backBtn.frame = CGRect (x: 0, y: 0, width: 30, height: 30)
        backBtn.setImage(UIImage (named: "backStretchBackgroundNormal~iphone"), for: .normal)
        backBtn.setImage(UIImage (named: "backStretchBackgroundNormal~iphone"), for: .highlighted)
        backBtn.addTarget(self, action: #selector(backBtnClick(_:)), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backBtn)
        backBtn.isHidden = true

    }

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool)
    {
        if navigationController.viewControllers.count > 1 {
            self.backBtn.isHidden = false
        }else
        {
            backBtn.isHidden = true
        }
    }
    
    func backBtnClick(_ sender:UIButton) -> Void {
        self.navigationController!.popViewController(animated: true)
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
