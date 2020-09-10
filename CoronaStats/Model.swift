//
//  Model.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/09/11.
//  Copyright © 2020 김믿음. All rights reserved.
//

import Foundation

struct TotalData {
    
    let confirmed : Int
    let critical : Int
    let deaths : Int
    let lastChange : String
    let lastUpdate : String
    let recovered : Int
    
    var fatalityRate : Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoverRate : Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
    }

    
}
