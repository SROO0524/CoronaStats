//
//  MapContainerView.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/10/23.
//  Copyright © 2020 김믿음. All rights reserved.
//

import SwiftUI

struct MapContainerView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    
    var body: some View {
        MapView(countryData: $covidFetch.allcountries)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
