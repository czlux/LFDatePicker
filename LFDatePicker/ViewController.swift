//
//  ViewController.swift
//  LFDatePicker
//
//  Created by YLW on 2019/1/10.
//  Copyright © 2019 LLF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pickView:LFDatePickView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickView = LFDatePickView(dateFormat: .YearMonthDay)
        self.view.addSubview(pickView!)
        
        let safeGuide = self.view.safeAreaLayoutGuide
        pickView?.translatesAutoresizingMaskIntoConstraints = false
        
        pickView?.topAnchor.constraint(equalTo: safeGuide.topAnchor).isActive = true
        pickView?.leftAnchor.constraint(equalTo: safeGuide.leftAnchor).isActive = true
        pickView?.rightAnchor.constraint(equalTo: safeGuide.rightAnchor).isActive = true
        pickView?.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor).isActive = true
        
//        pickView?.setNeedsLayout()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

