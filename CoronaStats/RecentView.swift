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
                
                // 검색시 필터링 되는 기능
                List {
                    ForEach(covidFetch.allcountries.filter {
                        self.searchText.isEmpty ? true : // Searchbar에 빈값일때는 모든 나라의 데이터를 오름차순으로 리스팅
                            $0.country.lowercased().contains(self.searchText.lowercased())
                    }, id: \.country) { countryData in
                        
                        // NavigationLink : NavigationView의 다음 View로 넘어갈 수 있게 해주는 링크, 셀안에서는 > 로 표기됨
                        
                        NavigationLink(destination:
                            CountryDetailView(countryData: countryData)) {
                            CountryDataRowView(countryData: countryData)
                            
                        }
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
