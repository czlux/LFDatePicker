//
//  Model.swift
//  LFDatePicker
//
//  Created by YLW on 2019/1/10.
//  Copyright © 2019 LLF. All rights reserved.
//

import Foundation

let MinYear = 2010
let MaxYear = 2019

class BaseModel {
    var i : Int = 0
    var s:[BaseModel] = Array()
    init() {
        
    }
}
class DateModel{
    
    var dataArr:[BaseModel] = Array()
    
    init() {
       
        for y in MinYear...MaxYear{
           
            let yearModel = BaseModel()
            yearModel.i = y
            
            for m in 1..<13{
                
                var monthModel = BaseModel()
                monthModel.i = m
                yearModel.s.append(monthModel)
                
                let day = countDaysByYearAndMonth(year: y, month: m)
                for d in 1...day{
                     let dayModel = BaseModel()
                    dayModel.i = d
                    monthModel.s.append(dayModel)
                }
            }
            dataArr.append(yearModel)
        }
        

    }
    //根据年份月份计算天数
    func countDaysByYearAndMonth(year:Int,month:Int) ->Int{
    
        let runYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
        
        switch month {
        case 1,3,5,7,8,10,12:
            return 31
        case 4,6,9,11:
            return 30
        case 2:
            return runYear ? 28 : 29
        default:
            return 0
        }
        
        return 0
    }
    
}
