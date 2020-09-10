//
//  ContentView.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/09/10.
//  Copyright © 2020 김믿음. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var CovidFetch = CovidFetchRequest()
    
    var body: some View {
        Text("\(CovidFetch.totalData.confirmed)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
