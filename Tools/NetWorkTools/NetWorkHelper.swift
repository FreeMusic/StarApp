//
//  NetWorkHelper.swift
//  TableView
//
//  Created by 橘子 on 2018/10/31.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit
import SwiftyJSON
import SVProgressHUD

enum MethodType {
    case GET
    case POST
}

class NetWorkHelper: NSObject {
    
    static let tool = NetWorkHelper()
    
    struct result {
        var res_data:[String:Any]?
        var list:Array<Any>
    }
    
    var localPara:[String:Any] = ["pageNumber":"1"]
    //"http://www.zhongleme.net/news/list"
    //首页
    func requestMainViewControllerData(url:String, params: [String:Any], _ comp:@escaping ((result) -> Void)){
        SXYNetWork.requestWith(Method: .get, URL: url, Parameter: params, Token: nil) { (res) in
            do {
                let dic = self.dataToDictionary(data: res.data!)
                let data = dic!["data"] as! NSDictionary
                let list = data["rows"] as! NSArray
                var dataSource = [Any]()
                
                if list.count > 0 {
                    for elem in list{
                        let model = HomeModel.init(dictionary: elem as! [AnyHashable : Any])
                        dataSource.append(model as Any)
                    }
                }
                let aResult = result(res_data:data as? [String : Any], list: dataSource)
                comp(aResult)
            } 
        }
    }
    
    func dataToDictionary(data:Data) ->Dictionary<String, Any>?{
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            let dic = json as! Dictionary<String, Any>
            
            return dic
        } catch _ {
            print("失败")
            
            return nil
        }
    }
}
