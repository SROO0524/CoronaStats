//
//  RecentView.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/09/11.
//  Copyright © 2020 김믿음. All rights reserved.
//

import SwiftUI

struct RecentView: View {
    
    @ObservedObject var CovidFetch = CovidFetchRequest()
    @State var searchText = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                ListHeaderView()
//                List {
////                    ForEach(CovidFetch.allcountries.filter {
////                        self.searchText.isEmpty ? true : $0.country.lowercased().contains(self.searchText
////                            .lowercased()
////                        )
////
////                    }, id: \.country) { CountryData in
////
////
////
////                    }
////
////                    )
//
//                }
                
            }
        } // End of Navigation
        
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
