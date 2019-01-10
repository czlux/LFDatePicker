//
//  Views.swift
//  LFDatePicker
//
//  Created by YLW on 2019/1/10.
//  Copyright © 2019 LLF. All rights reserved.
//

import Foundation
import UIKit





enum DateType:Int {
    
    case YearMonthDay
    case YearMonth
    case MonthDay
}


class LFDatePickView:UIView{
    
    private var blackView = UIView()
    
    private var whiteBGView = UIView()
    
    private var cancelBtn = UIButton(type: .custom)
    private var confirmBtn = UIButton(type: .custom)
    
    private var datePicker = UIPickerView()
    
    private var dataModel = DateModel()
    
    private var dateType = DateType.YearMonth
    
    var currentYearIndex = 0
    var currentMonthIndex = 0
    var currentDayIndex = 0
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        blackView.backgroundColor = UIColor.black
        blackView.alpha = 0.7
        self.addSubview(blackView)
        
        whiteBGView.backgroundColor = UIColor.white
        self.addSubview(whiteBGView)
        
        cancelBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.setTitleColor(UIColor.darkGray, for: .normal)
        whiteBGView.addSubview(cancelBtn)
        
        confirmBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        confirmBtn.setTitle("确定", for: .normal)
        confirmBtn.setTitleColor(UIColor.darkGray, for: .normal)
        whiteBGView.addSubview(confirmBtn)
        
        datePicker.delegate = self
        datePicker.dataSource = self
        whiteBGView.addSubview(datePicker)
        
    }
    convenience init(dateFormat:DateType) {
       self.init(frame: CGRect.zero)
        self.dateType = dateFormat
    }
    override func layoutSubviews() {
        blackView.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
        whiteBGView.frame = CGRect(x: 0, y: self.height - 300, width: self.width, height: 300)
        cancelBtn.frame = CGRect(x: 20, y: 10, width: 80, height: 30)
        confirmBtn.frame = CGRect(x: self.width - 100, y: 10, width: 80, height: 30)
        datePicker.frame = CGRect(x: 0, y: 40, width: self.width, height: 260)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension LFDatePickView:UIPickerViewDelegate,UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch self.dateType {
        case .YearMonthDay:
            if component == 0{
                return self.dataModel.dataArr.count
            }else if component == 1{
                return self.dataModel.dataArr[currentYearIndex].s.count
            }else{
                return self.dataModel.dataArr[currentYearIndex].s[currentMonthIndex].s.count
            }
        case .YearMonth:
            if component == 0{
                 return self.dataModel.dataArr.count
            }else {
                return self.dataModel.dataArr[currentYearIndex].s.count
            }
        default:
            return 0
        }

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        switch self.dateType {
        case .YearMonthDay:
            return 3
        case .YearMonth:
            return 2
        default:
            return 0
        }
      
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        switch self.dateType {
        case .YearMonthDay:
            if component == 0{
                return String(self.dataModel.dataArr[row].i)
            }else if component == 1{
                return String(self.dataModel.dataArr[currentYearIndex].s[row].i)
            }else{
                return String(self.dataModel.dataArr[currentYearIndex].s[currentMonthIndex].s[row].i)
            }
        case .YearMonth:
            if component == 0{
                return String(self.dataModel.dataArr[row].i)
            }else {
                return String(self.dataModel.dataArr[currentYearIndex].s[row].i)
            }
        default:
            return "--"
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch self.dateType {
        case .YearMonthDay:
            if component == 0{
                currentYearIndex = row
                currentMonthIndex = 0
                currentDayIndex = 0
                pickerView.selectRow(0, inComponent: 1, animated: false)
                pickerView.selectRow(0, inComponent: 2, animated: false)
            }else if component == 1{
                currentMonthIndex = row
                currentDayIndex = 0
                pickerView.selectRow(0, inComponent: 2, animated: false)
            }else{
                currentDayIndex = row
            }
        case .YearMonth:
            if component == 0{
                currentYearIndex = row
                currentMonthIndex = 0
            }else {
                currentMonthIndex = row
            }
        default:
            break
        }
        pickerView.reloadAllComponents()
    }
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let rview = view as? UILabel
//
//        if let cell = rview{
//
//            return cell
//        }
//
//        return UIView()
//    }
}
