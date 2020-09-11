//
//  CountryDetailView.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/09/12.
//  Copyright © 2020 김믿음. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    var countryData : CountryData
    
    var body: some View {
        VStack {
            
            VStack {
                CountryDetailrow(number: countryData.confirmed.formatNumber(), name: "Confirmed")
                    .padding(.top)
                CountryDetailrow(number: countryData.critical.formatNumber(), name: "Critical", color: .yellow)
                CountryDetailrow(number: countryData.deaths.formatNumber(), name: "Death", color: .red)
                CountryDetailrow(number: String(format: "%.2f", countryData.fatalityRate), name: "Death %", color: .red)
                CountryDetailrow(number: countryData.confirmed.formatNumber(), name: "Recovered", color: .green)
                CountryDetailrow(number: String(format: "%.2f", countryData.recoverRate), name: "Recovery %", color: .green)
                
                
            }
                
            .background(Color("CardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            Spacer()
        }
        
        .padding(.top,50)
        .navigationBarTitle(countryData.country)
        
    }
    
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryData: testCountryData)
    }
}
