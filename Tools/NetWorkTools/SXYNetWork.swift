//
//  SXYNetWork.swift
//  TableView
//
//  Created by 橘子 on 2018/10/31.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SXYNetWork: NSObject {
    
    struct responseData {
        var request:URLRequest?
        var response:HTTPURLResponse?
        var json:AnyObject?
        var error:NSError?
        var data:Data?
    }
    
    class func requestWith(Method method:Alamofire.HTTPMethod, URL url:String, Parameter para:[String:Any]?, Token token:String?, handler: @escaping (responseData) -> Void){
        let reachAble = SXYNetworkReachability.reachAbility.reachAble
        if reachAble {
            var dicToken:[String:String]!
            if token != nil {
                dicToken = ["tokenId":token!]
            }
            
            let manager = Alamofire.SessionManager.default
            manager.session.configuration.timeoutIntervalForRequest = 10
            manager.request(url, method: method, parameters: para, encoding: URLEncoding.default, headers: dicToken).response(completionHandler: { (response) in
                let json:AnyObject! = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as AnyObject
                if nil != json {
                    let res = responseData(request:response.request, response:response.response, json:json, error:response.error as NSError?, data:response.data)
                    
                    handler(res)
                }
            })
        }
    }
    
}
