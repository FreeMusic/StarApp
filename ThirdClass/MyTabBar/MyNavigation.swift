//
//  MyNavigation.swift
//  StarAPP
//
//  Created by 刘园 on 2018/4/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import UIKit

class MyNavigation: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let navigationTitleAttribute : NSDictionary = NSDictionary(object: UIColor.black,forKey: NSForegroundColorAttributeName as NSCopying)
        self.navigationBar.titleTextAttributes = navigationTitleAttribute as! [AnyHashable: Any] as? [String : AnyObject]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
