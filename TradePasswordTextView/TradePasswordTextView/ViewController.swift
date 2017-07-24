//
//  ViewController.swift
//  TradePasswordTextView
//
//  Created by JFYT on 2017/7/24.
//  Copyright © 2017年 F. All rights reserved.
//

import UIKit

class ViewController: UIViewController, JFTradeTextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tradeTextField = JFTradeTextField(frame: CGRect.init(x: 0, y: 60, width: kScreenWidth, height: 100), title: "请输入您的交易密码")
        tradeTextField.delegate = self
        self.view.addSubview(tradeTextField)
    }
    
    func inputTradePasswordFinish(tradePasswordView: JFTradeTextField, password: String) {
        print("您输入的交易密码: \(password)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

