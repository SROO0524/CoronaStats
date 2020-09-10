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

struct CountryData {
    
    let country : String
    let confirmed : Int64
    let critical : Int64
    let deaths : Int64
    let lastChange : String
    let lastUpdate : String
    let recovered : Int64
    let longitude : Double
    let latitude : Double
    
    var fatalityRate : Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoverRate : Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
    }

    
}

let testTotalData = TotalData(confirmed: 28149324, critical: 60520, deaths: 915855, lastChange: "2020-09-10T16:51:37+02:00", lastUpdate: "2020-09-10T17:00:04+02:00", recovered: 20174048)

let testCountryData = CountryData(country: "Korea", confirmed: 200, critical: 200, deaths: 20, lastChange: "2020-09-10T16:51:37+02:00", lastUpdate: "2020-09-10T17:00:04+02:00", recovered: 100, longitude: 0.0, latitude: 0.0)
