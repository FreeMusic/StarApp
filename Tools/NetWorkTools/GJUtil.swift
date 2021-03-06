//
//  GJUtil.swift
//  TableView
//
//  Created by 橘子 on 2018/10/31.
//  Copyright © 2018年 橘子. All rights reserved.
//

import UIKit

class GJUtil: NSObject {
    class func createLabelWith(Text text:String?, Frame frame:CGRect, TextColor textColor:UIColor?, Font font:CGFloat?, TextAligtment textAlightment:NSTextAlignment?) -> UILabel{
        let label = UILabel(frame: frame)
        if textColor != nil {
            label.textColor = textColor
        }
        if text != nil {
            label.text = text
        }
        if font != nil {
            label.font = UIFont.systemFont(ofSize: font!)
        }
        if textAlightment != nil {
            label.textAlignment = textAlightment!
        }
        return label
    }
    
    class func createButtonWith(Type btnType:UIButtonType, Title title:String?, Frame frame:CGRect, TitleColor titleColor:UIColor?, Font font:CGFloat?, BackgroundColor backgroundColor:UIColor?, Target target:Any?, Action action:Selector?, TextAligtment textAlightment:NSTextAlignment?) -> UIButton{
        let button = UIButton(type: btnType)
        button.frame  = frame
        if title != nil {
            button.setTitle(title, for: .normal)
        }
        if backgroundColor != nil {
            button.backgroundColor = backgroundColor
        }
        if titleColor != nil {
            button.setTitleColor(titleColor, for: .normal)
        }
        if font != nil {
            button.titleLabel?.font = UIFont.systemFont(ofSize: font!)
        }
        if target != nil && action != nil {
            button.addTarget(target, action: action!, for: .touchUpInside)
        }
        if textAlightment != nil {
            button.titleLabel?.textAlignment = textAlightment!
        }
        return button
    }
    
    class func createTextFieldWith(Frame frame:CGRect, BoardStyle boardStyle:UITextBorderStyle, PlaceHolder placeHolder:String?, BackgroundColor backgroundColor:UIColor?, TintColor tintColor:UIColor?, IsPWD isPwd:Bool) -> UITextField{
        let textField = UITextField(frame: frame)
        textField.borderStyle = boardStyle
        if placeHolder != nil {
            textField.placeholder = placeHolder
        }
        if backgroundColor != nil {
            textField.backgroundColor = backgroundColor
        }
        if tintColor != nil {
            textField.tintColor = tintColor
        }
        textField.clearButtonMode = .always
        if isPwd {
            textField.isSecureTextEntry = true
        }
        return textField
    }
    
    class func createImageViewWith(Frame frame:CGRect, ImageName imageName:String, CornarRadius radius:Float) -> UIImageView{
        let imageView = UIImageView(frame:frame)
        imageView.image = UIImage(named:imageName)
        imageView.layer.cornerRadius = CGFloat(radius)
        return imageView
    }
    
    class func createViewWith(Frame frame:CGRect, BackgroundColor backgroundColor:UIColor?) -> UIView{
        let view = UIView(frame:frame)
        if backgroundColor != nil {
            view.backgroundColor = backgroundColor
        }
        return view
    }
    
    class func SET_USER_DEFAULTS(Key key:String, Value value:Any){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func GET_USER_DEFAULTS(Key key:String) -> Any?{
        return UserDefaults.standard.value(forKey:key) ?? ""
    }

    
    //base64加密
    class func encodingBase64(String str:String) -> String{
        let data = str.data(using: String.Encoding.utf8)
        return (data?.base64EncodedString(options: .lineLength64Characters))!
    }
    
    //将当前时间转换成毫秒时间
    class func changeNowDateToTimeStamp() -> Int{
        return Int(Date().timeIntervalSince1970)
    }
    
    //由颜色生成图片
    class func createImageFrom(Color color:UIColor) -> UIImage{
        let rect = CGRect(x:0, y:0, width:1, height:1)
        UIGraphicsBeginImageContext(rect.size)
        let context:CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    //判断手机号码合法性
    class func isValid(MobilePhone phone:String) -> Bool {
        if phone.count != 11 {
            return false
        }
        
        let  CM = "(^1(3[4-9]|4[7]|5[0-27-9]|7[8]|8[2-478])\\d{8}$)|(^1705\\d{7}$)";
        let  CU = "(^1(3[0-2]|4[5]|5[56]|7[6]|8[56])\\d{8}$)|(^1709\\d{7}$)";
        let  CT = "(^1(33|53|77|8[019])\\d{8}$)|(^1700\\d{7}$)";
        
        let regextestcm = NSPredicate(format: "SELF MATCHES %@",CM )
        let regextestcu = NSPredicate(format: "SELF MATCHES %@" ,CU)
        let regextestct = NSPredicate(format: "SELF MATCHES %@" ,CT)
        
        if regextestcm.evaluate(with: phone) || regextestct.evaluate(with: phone) || regextestcu.evaluate(with: phone){
            return true
        }else{
            return false
        }
    }
    
    //判断字符串条件 1:数字 2:英文 3:符合的英文+数字
    class func isHaveNumAndLetter(String string:String) -> Int {
        do {
            let tNumRegularExpression =  try NSRegularExpression.init(pattern: "[0-9]", options: .caseInsensitive)
            let tNumMatchCount:Int = tNumRegularExpression.numberOfMatches(in: string, options: .reportProgress, range: NSMakeRange(0, string.count))
            
            let tLetterRegularExpression = try NSRegularExpression.init(pattern: "[A-Za-z]", options: .caseInsensitive)
            let tLetterMatchCount:Int = tLetterRegularExpression.numberOfMatches(in: string, options: .reportProgress, range: NSMakeRange(0, string.count))
            
            if tNumMatchCount == string.count {
                return 1
            }else if tLetterMatchCount == string.count {
                return 2
            }else if tNumMatchCount + tLetterMatchCount == string.count {
                return 3
            }else{
                return 4
            }
        }catch{return 0}
    }
    
    //判断字符串是否存在
    class func isBlankString(String string:String?) -> String{
        if nil == string{
            return ""
        }
        
        return string!
    }
}
