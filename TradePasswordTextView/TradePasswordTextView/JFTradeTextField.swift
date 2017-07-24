//
//  JFTradeTextField.swift
//  BYR-SWIFT
//
//  Created by JFYT on 2017/7/24.
//  Copyright © 2017年 F. All rights reserved.
//

import UIKit

let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height
//密码框的宽度
let BoxWidth = (kScreenWidth - 70)/6

protocol JFTradeTextFieldDelegate: class {
    func inputTradePasswordFinish(tradePasswordView: JFTradeTextField, password: String) -> Void
}

class JFTradeTextField: UIView, UITextFieldDelegate {

    weak var delegate: JFTradeTextFieldDelegate?
    
    fileprivate var lable_title: UILabel?
    fileprivate var titleLabel: UILabel?
    var textField: UITextField?
    var textFieldText: String?
    
    fileprivate var view_box: UIView?
    fileprivate var view_box2: UIView?
    fileprivate var view_box3: UIView?
    fileprivate var view_box4: UIView?
    fileprivate var view_box5: UIView?
    fileprivate var view_box6: UIView?
    
    fileprivate var lable_point: UILabel?
    fileprivate var lable_point2: UILabel?
    fileprivate var lable_point3: UILabel?
    fileprivate var lable_point4: UILabel?
    fileprivate var lable_point5: UILabel?
    fileprivate var lable_point6: UILabel?
    
    init(frame: CGRect, title: String? = "") {
        super.init(frame: frame)
        
        //标题
        self.lable_title = UILabel()
        self.lable_title?.frame = CGRect(x: 0, y: 20, width: kScreenWidth, height: 20)
        self.lable_title?.text = title
        self.lable_title?.textAlignment = .center
        self.lable_title?.textColor = UIColor.lightGray
        self.addSubview(self.lable_title!)
        
        //TextField
        self.textField = UITextField()
        self.textField?.frame = CGRect.zero
        self.textField?.delegate = self
        self.textField?.keyboardType = .numberPad
        self.textField?.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        self.addSubview(self.textField!)

        let x = (frame.width - 6 * BoxWidth) / 2
        
        //假的输入框
        self.view_box = UIView(frame: CGRect(x: CGFloat(x), y: CGFloat(60), width: BoxWidth, height: BoxWidth))
        self.view_box?.layer.borderWidth = 1
        self.view_box?.layer.borderColor = UIColor.lightGray.cgColor
        self.addSubview(self.view_box!)
        
        self.view_box2 = UIView(frame: CGRect.init(x: CGFloat(x) - 1 + BoxWidth * 1, y: (self.view_box?.frame.origin.y)!, width: BoxWidth, height: BoxWidth))
        self.view_box2?.layer.borderWidth = 1
        self.view_box2?.layer.borderColor = UIColor.lightGray.cgColor
        self.addSubview(self.view_box2!)
        
        self.view_box3 = UIView(frame: CGRect.init(x: CGFloat(x) - 2 + BoxWidth * 2, y: (self.view_box?.frame.origin.y)!, width: BoxWidth, height: BoxWidth))
        self.view_box3?.layer.borderWidth = 1
        self.view_box3?.layer.borderColor = UIColor.lightGray.cgColor
        self.addSubview(self.view_box3!)
        
        self.view_box4 = UIView(frame: CGRect.init(x: CGFloat(x) - 3 + BoxWidth * 3, y: (self.view_box?.frame.origin.y)!, width: BoxWidth, height: BoxWidth))
        self.view_box4?.layer.borderWidth = 1
        self.view_box4?.layer.borderColor = UIColor.lightGray.cgColor
        self.addSubview(self.view_box4!)
        
        self.view_box5 = UIView(frame: CGRect.init(x: CGFloat(x) - 4 + BoxWidth * 4, y: (self.view_box?.frame.origin.y)!, width: BoxWidth, height: BoxWidth))
        self.view_box5?.layer.borderWidth = 1
        self.view_box5?.layer.borderColor = UIColor.lightGray.cgColor
        self.addSubview(self.view_box5!)
        
        self.view_box6 = UIView(frame: CGRect.init(x: CGFloat(x) - 5 + BoxWidth * 5, y: (self.view_box?.frame.origin.y)!, width: BoxWidth, height: BoxWidth))
        self.view_box6?.layer.borderWidth = 1
        self.view_box6?.layer.borderColor = UIColor.lightGray.cgColor
        self.addSubview(self.view_box6!)
        
        
        //密码点
        self.lable_point = UILabel()
        self.lable_point?.frame = CGRect.init(x: (BoxWidth - 10)/2, y: (BoxWidth - 10)/2, width: 10, height: 10)
        self.lable_point?.layer.cornerRadius = 5
        self.lable_point?.layer.masksToBounds = true
        self.lable_point?.backgroundColor = UIColor.black
        self.view_box?.addSubview(self.lable_point!)
        
        self.lable_point2 = UILabel()
        self.lable_point2?.frame = CGRect.init(x: (BoxWidth - 10)/2, y: (BoxWidth - 10)/2, width: 10, height: 10)
        self.lable_point2?.layer.cornerRadius = 5
        self.lable_point2?.layer.masksToBounds = true
        self.lable_point2?.backgroundColor = UIColor.black
        self.view_box2?.addSubview(self.lable_point2!)
        
        self.lable_point3 = UILabel()
        self.lable_point3?.frame = CGRect.init(x: (BoxWidth - 10)/2, y: (BoxWidth - 10)/2, width: 10, height: 10)
        self.lable_point3?.layer.cornerRadius = 5
        self.lable_point3?.layer.masksToBounds = true
        self.lable_point3?.backgroundColor = UIColor.black
        self.view_box3?.addSubview(self.lable_point3!)
        
        self.lable_point4 = UILabel()
        self.lable_point4?.frame = CGRect.init(x: (BoxWidth - 10)/2, y: (BoxWidth - 10)/2, width: 10, height: 10)
        self.lable_point4?.layer.cornerRadius = 5
        self.lable_point4?.layer.masksToBounds = true
        self.lable_point4?.backgroundColor = UIColor.black
        self.view_box4?.addSubview(self.lable_point4!)
        
        self.lable_point5 = UILabel()
        self.lable_point5?.frame = CGRect.init(x: (BoxWidth - 10)/2, y: (BoxWidth - 10)/2, width: 10, height: 10)
        self.lable_point5?.layer.cornerRadius = 5
        self.lable_point5?.layer.masksToBounds = true
        self.lable_point5?.backgroundColor = UIColor.black
        self.view_box5?.addSubview(self.lable_point5!)
        
        self.lable_point6 = UILabel()
        self.lable_point6?.frame = CGRect.init(x: (BoxWidth - 10)/2, y: (BoxWidth - 10)/2, width: 10, height: 10)
        self.lable_point6?.layer.cornerRadius = 5
        self.lable_point6?.layer.masksToBounds = true
        self.lable_point6?.backgroundColor = UIColor.black
        self.view_box6?.addSubview(self.lable_point6!)
        
        self.lable_point?.isHidden = true
        self.lable_point2?.isHidden = true
        self.lable_point3?.isHidden = true
        self.lable_point4?.isHidden = true
        self.lable_point5?.isHidden = true
        self.lable_point6?.isHidden = true
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(oneTap(ges:)))
        self.addGestureRecognizer(tap)
        
    }
    
    func oneTap(ges: UITapGestureRecognizer) -> Void {
        self.textField?.becomeFirstResponder()
    }
    
    func textFieldDidChange(textField: UITextField) -> Void {
        
        switch (textField.text?.characters.count)! {
        case 0:
            self.lable_point?.isHidden = true
            self.lable_point2?.isHidden = true
            self.lable_point3?.isHidden = true
            self.lable_point4?.isHidden = true
            self.lable_point5?.isHidden = true
            self.lable_point6?.isHidden = true
        case 1:
            self.lable_point?.isHidden = false
            self.lable_point2?.isHidden = true
            self.lable_point3?.isHidden = true
            self.lable_point4?.isHidden = true
            self.lable_point5?.isHidden = true
            self.lable_point6?.isHidden = true
        case 2:
            self.lable_point?.isHidden = false
            self.lable_point2?.isHidden = false
            self.lable_point3?.isHidden = true
            self.lable_point4?.isHidden = true
            self.lable_point5?.isHidden = true
            self.lable_point6?.isHidden = true
        case 3:
            self.lable_point?.isHidden = false
            self.lable_point2?.isHidden = false
            self.lable_point3?.isHidden = false
            self.lable_point4?.isHidden = true
            self.lable_point5?.isHidden = true
            self.lable_point6?.isHidden = true
        case 4:
            self.lable_point?.isHidden = false
            self.lable_point2?.isHidden = false
            self.lable_point3?.isHidden = false
            self.lable_point4?.isHidden = false
            self.lable_point5?.isHidden = true
            self.lable_point6?.isHidden = true
        case 5:
            self.lable_point?.isHidden = false
            self.lable_point2?.isHidden = false
            self.lable_point3?.isHidden = false
            self.lable_point4?.isHidden = false
            self.lable_point5?.isHidden = false
            self.lable_point6?.isHidden = true
        case 6:
            self.lable_point?.isHidden = false
            self.lable_point2?.isHidden = false
            self.lable_point3?.isHidden = false
            self.lable_point4?.isHidden = false
            self.lable_point5?.isHidden = false
            self.lable_point6?.isHidden = false
        default:
            break
        }
        
        self.textFieldText = textField.text
        if textField.text?.characters.count == 6 {
            self.delegate?.inputTradePasswordFinish(tradePasswordView: self, password: self.textFieldText!)
        }
        
    }
    
    func refreshTextField(textField: UITextField) -> Void {
        self.textFieldDidChange(textField: textField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if (textField.text?.characters.count)! >= 6 && string != "" {
            return false
        }
        
        return true
        
    }
    
}
