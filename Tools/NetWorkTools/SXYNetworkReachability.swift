//
//  SXYNetworkReachability.swift
//  TableView
//
//  Created by 橘子 on 2018/10/31.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class SXYNetworkReachability: NSObject {
    static let reachAbility = SXYNetworkReachability()
    
    var reachAble:Bool = {
        var reach = true
        
        let manager = NetworkReachabilityManager(host: "www.baidu.com")
        
        manager?.listener = { status in
            switch status {
            case .notReachable:
                reach = false
                SVProgressHUD.showError(withStatus: "网络出错")
            case .reachable(.ethernetOrWiFi):
                reach = true
            case .reachable(.wwan):
                reach = true
            case .unknown:
                reach = false
                SVProgressHUD.showError(withStatus: "网络出错")
            }
        }
        manager?.startListening()
        
        return reach
    }()
}
