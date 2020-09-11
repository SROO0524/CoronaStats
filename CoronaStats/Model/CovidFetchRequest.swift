//
//  CovidFetchRequest.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/09/10.
//  Copyright © 2020 김믿음. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CovidFetchRequest: ObservableObject {
    
    let headers : HTTPHeaders = [
        "X-RapidAPI-Host": "covid-19-data.p.rapidapi.com",
        "X-RapidAPI-Key": "d172e810e7msh47584ae043c146dp12d8eejsnb0b3c42c4a59"
    ]
    
    @Published var allcountries : [CountryData] = []
    @Published var totalData: TotalData = testTotalData
    
    
    init() {
        
        getCurrentTotal()
        getAllCountries()
        
    }
    
    func getCurrentTotal() {
        
        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json", headers:
            headers).responseJSON { response in
                
                let result = response.data
                
                if result != nil {
                    let json  = JSON(result!)
                    //                    print(json)
                    
                    let confirmed = json[0]["confirmed"].intValue
                    let deaths = json[0]["deaths"].intValue
                    let recovered = json[0]["recovered"].intValue
                    let critical = json[0]["critical"].intValue
                    let lastChange = json[0]["lastChange"].stringValue
                    let lastUpdate = json[0]["lastUpdate"].stringValue
                    
                    self.totalData = TotalData(confirmed: confirmed, critical: critical, deaths: deaths, lastChange: lastChange, lastUpdate: lastUpdate, recovered: recovered)
                } else {
                    self.totalData = testTotalData
                }
        }
    }
    
    
    func getAllCountries() {
        
        
        AF.request("https://covid-19-data.p.rapidapi.com/country/all?format=json", headers:
            headers).responseJSON { response in
                
                let result = response.value
                if result != nil {
                    
                    
                    let dataDictionary = result as! [Dictionary<String , AnyObject>]
                    
                    for countryData in dataDictionary {
                        let country = countryData["country"] as? String ?? "Error"
                        let longitude = countryData["longitude"] as? Double ?? 0.0
                        let latitude = countryData["latitude"] as? Double ?? 0.0
                        
                        let confirmed = countryData["confirmed"] as? Int64 ?? 0
                        let deaths = countryData["deaths"] as? Int64 ?? 0
                        let recovered = countryData["recovered"] as? Int64 ?? 0
                        let critical = countryData["critical"] as? Int64 ?? 0
                        let lastChange = countryData["lastChange"] as? String ?? "Error"
                        let lastUpdate = countryData["lastUpdate"] as? String ?? "Error"
                        
                        let countryObject = CountryData(country: country, confirmed: confirmed, critical: critical, deaths: deaths, lastChange: lastChange, lastUpdate: lastUpdate, recovered: recovered, longitude: longitude, latitude: latitude)
                        
                        self.allcountries.append(countryObject)
                    }
                }
            self.allcountries = self.allcountries.sorted(by:{ $0.confirmed > $1.confirmed})
        }
        
    }
    
}
