//
//  RecentView.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/09/11.
//  Copyright © 2020 김믿음. All rights reserved.
//

import SwiftUI

struct RecentView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                TotalDataView(totalData: covidFetch.totalData) // 올리는 순서대로 생기는듯?
                ListHeaderView()
                List {
                    ForEach(covidFetch.allcountries.filter {
                        self.searchText.isEmpty ? true :
                            $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country) { countryData in
                        
                        CountryDataRowView(countryData: countryData)
                    }

                }
            }
        } // End of Navigation
        
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
