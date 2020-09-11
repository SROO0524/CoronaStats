//
//  Extension.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/09/11.
//  Copyright © 2020 김믿음. All rights reserved.
//

import Foundation

//    MARK: 세 자리 수 마다 콤마(,) 찍고, String Type으로 값을 받는 함수 

extension Int {
    
    func formatNumber() -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }
}

extension Int64 {
    
    func formatNumber() -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: self))!
    }
}
