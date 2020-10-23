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
                
                CountryDetailrow(number: "+" + (countryStatisticsRequest.detatilCountryData?.newCases.formatNumber() ?? "Err"), name: "New Cases")
                
                CountryDetailrow(number: countryStatisticsRequest.detatilCountryData?.recoveredCases.formatNumber() ?? "Err", name: "Recovered Cases", color: .green)
                
                CountryDetailrow(number: countryStatisticsRequest.detatilCountryData?.criticalCases.formatNumber() ?? "Err", name: "Criticle Cases", color: .yellow)
                
                CountryDetailrow(number: countryStatisticsRequest.detatilCountryData?.deaths.formatNumber() ?? "Err", name: "Death Cases", color: .red)
                
                CountryDetailrow(number: "+" + (countryStatisticsRequest.detatilCountryData?.newDeaths.formatNumber() ?? "Err"), name: "New Death", color: .red)
                
                CountryDetailrow(number: countryStatisticsRequest.detatilCountryData?.testDone.formatNumber() ?? "Err", name: "Test Done", color: .yellow)
                
                CountryDetailrow(number: String(format: "%.2f", countryStatisticsRequest.detatilCountryData?.fatalityRate ?? 0.0) + "%", name: "Fatality Rate", color: .red)
                
                CountryDetailrow(number: String(format: "%.2f", countryStatisticsRequest.detatilCountryData?.recoverRate ?? 0.0) + "%", name: "Recovery Rate", color: .green)

                
                

            }
                
            .background(Color("CardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            Spacer()
        }
        
        .padding(.top,25)
        .navigationBarTitle(countryName)
        .onAppear(){
            self.getStaticstacics()
        }
        
    }
    
    private func getStaticstacics() {
        countryStatisticsRequest.getStatsFor(country: self.countryName)
        
    }
    
}

