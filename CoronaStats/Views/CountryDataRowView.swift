//
//  CountryDataRowView.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/09/11.
//  Copyright © 2020 김믿음. All rights reserved.
//

import SwiftUI

struct CountryDataRowView: View {
    
    var countryData: CountryData
    
    var body: some View {
        
        HStack {
            
            Text(countryData.country)
                .fontWeight(.medium)
                .font(.subheadline)
                .frame(width: 110, alignment: .leading)
                .lineLimit(2) // 텍스트의 줄 수 (2줄)
                .padding(.leading, 2)
            
            Spacer()
            
            Text(countryData.confirmed.formatNumber())
                .font(.subheadline)
                .frame(width: 80, height: 40)
                .padding(.leading, -30)
            
            Spacer()
            
            Text(countryData.deaths.formatNumber())
                .frame(width: 80,height: 40,alignment: .center)
                .foregroundColor(.red)
                .font(.subheadline)
                .padding(.leading, 2)
            
            Spacer()
            
            Text(countryData.recovered.formatNumber())
                .frame(width: 80,height: 40,alignment: .center)
                .foregroundColor(.green)
                .font(.subheadline)
        }
        
        
        
    }
}

struct CountryDataRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDataRowView(countryData: testCountryData)
    }
}
