//
//  CountryDetailView.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/09/12.
//  Copyright © 2020 김믿음. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    @ObservedObject var countryStatisticsRequest = CountryStatisticsFetch()
    var countryName : String
    
    var body: some View {
        VStack {
            VStack {
                CountryDetailrow(number: countryStatisticsRequest.detatilCountryData?.confirmedCases.formatNumber() ?? "Err", name: "Confirmed")
                    
                    .padding(.top)
                
                CountryDetailrow(number: countryStatisticsRequest.detatilCountryData?.activeCases.formatNumber() ?? "Err", name: "Active Cases")
                
                CountryDetailrow(number: countryStatisticsRequest.detatilCountryData?.newCases.formatNumber() ?? "Err", name: "New Cases")
                

            }
                
            .background(Color("CardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            Spacer()
        }
        
        .padding(.top,50)
        .navigationBarTitle(countryName)
        .onAppear(){
            self.getStaticstacics()
        }
        
    }
    
    private func getStaticstacics() {
        countryStatisticsRequest.getStatsFor(country: self.countryName)
        
    }
    
}

