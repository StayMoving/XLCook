//
//  XLCookController.swift
//  XLCook
//
//  Created by Beyondream on 2017/7/19.
//  Copyright © 2017年 Beyondream. All rights reserved.
//

import UIKit

class XLCookController: XLBasicViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = navBarView

        self.leftBtn.setImage(UIImage (named: "creatrecipeicon~iphone"), for: .normal)
        self.leftBtn.setImage(UIImage (named: "creatrecipeicon~iphone"), for: .highlighted)
        
        self.rightBtn.setImage(UIImage (named: "buylistButtonImage~iphone"), for: .normal)
        self.rightBtn.setImage(UIImage (named: "buylistButtonImage~iphone"), for: .highlighted)
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
