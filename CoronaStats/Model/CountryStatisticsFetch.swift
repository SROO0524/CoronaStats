//
//  CountryStatisticsFetch.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/10/23.
//  Copyright © 2020 김믿음. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON

// 기존에 받아오던 데이터 + 추가로 현재 검사 중인 데이터 등등을 받아오기 위해 새로운 API 연동
class CountryStatisticsFetch: ObservableObject {
    
    @Published var detatilCountryData : DetailCountryData?
    
    let headers : HTTPHeaders = [
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": "6d4235bc12mshe8fb5bb4d6292e2p17f0bfjsn73e6988ebeb0"
    ]

    init() {}
    
    func getStatsFor(country:String) {
        
        AF.request("https://rapidapi.p.rapidapi.com/statistics?country=\(country)", headers:
            headers).responseJSON { response in
                
                let result = response.data
                
                if result != nil {
                    let json  = JSON(result!)
                    print(json)
    
                } else {
                    
                }
        }
    }
    
    

    
}
