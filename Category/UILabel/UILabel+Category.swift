//
//  UILabel+Category.swift
//  StarAPP
//
//  Created by 橘子 on 2018/11/2.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    /**
     UILabel  添加分类
     color  字体颜色
     font  字体大小
     text  label字体
     subView 父视图
     */
    convenience init(color: UIColor, font: CGFloat, text: String, subView:UIView){
        self.init()
        self.text = text
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: font)
        subView.addSubview(self)
    }
    
    func changeText(text:String, label: UILabel){
        label.text = text
    }
}
