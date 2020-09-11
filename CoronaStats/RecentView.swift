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
    @State var isSearchVisible = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                if isSearchVisible {
                    SearchView(searchText: $searchText)
                }
                
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
                
            .navigationBarTitle("Recent Data", displayMode: .inline )
            .navigationBarItems(trailing:
                
                // 상단 나라 검색 토글
                Button(action: {
                    
                    self.isSearchVisible.toggle()
                    
                    if !self.isSearchVisible {
                        self.searchText = ""
                        
                    }
                    
                },label: {
                    Image(systemName: "magnifyingglass")
                })
            )
            
        } // End of Navigation
        
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
