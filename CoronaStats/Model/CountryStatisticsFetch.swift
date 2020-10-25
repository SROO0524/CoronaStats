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
//         Key : 접근권한을 주는 것! 로그인시 사용
    ]
    
    init() {
    }
    
    func getStatsFor(country:String) {
        
        AF.request("https://rapidapi.p.rapidapi.com/statistics?country=\(country)", headers:
                    headers).responseJSON { response in
                        
                        let result = response.data
                        
                        if result != nil {
                            let json  = JSON(result!)
                            
                            let country = json["response"][0]["country"].stringValue
                            
                            let deaths = json["response"][0]["deaths"]["total"].intValue
                            let newDeaths = json["response"][0]["deaths"]["new"].intValue
                            
                            let tests = json["response"][0]["tests"]["total"].intValue
                            
                            let criticalCases = json["response"][0]["cases"]["critical"].intValue
                            let totalCases = json["response"][0]["cases"]["total"].intValue
                            let activeCases = json["response"][0]["cases"]["active"].intValue
                            let newCases = json["response"][0]["cases"]["new"].intValue
                            let recoveredCases = json["response"][0]["cases"]["recovered"].intValue
                            
                            self.detatilCountryData = DetailCountryData(country: country, confirmedCases: totalCases, newCases: newCases, recoveredCases: recoveredCases, criticalCases: criticalCases, activeCases: activeCases, deaths: deaths, newDeaths: newDeaths, testDone: tests)
                        }
                    }
    }
    
    
    
    
}
