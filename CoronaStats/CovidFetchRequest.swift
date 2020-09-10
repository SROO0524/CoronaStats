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
    
    init() {
        
        getCurrentTotal()
        
    }
    
    func getCurrentTotal() {

        let headers : HTTPHeaders = [
            "X-RapidAPI-Host": "covid-19-data.p.rapidapi.com",
            "X-RapidAPI-Key": "6d4235bc12mshe8fb5bb4d6292e2p17f0bfjsn73e6988ebeb0"
        ]
        
        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json", headers:
            headers).responseJSON { response in
                
                
            debugPrint(response)
        }
    }
    
    
}
