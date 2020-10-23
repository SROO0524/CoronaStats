//
//  ContentView.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/09/10.
//  Copyright © 2020 김믿음. All rights reserved.
//

import SwiftUI

// Tabbar 생성
struct ContentView: View {

    
    var body: some View {
        
        TabView {
            RecentView()
            .tabItem{
                Tab(imageName: "chart.bar", text: "Recent")
            }
            .tag(0)
            
        // map
            MapContainerView()
                //FillScreen 으로 보이도록 !
                .edgesIgnoringSafeArea(.vertical)
            .tabItem{
                Tab(imageName: "map", text: "Map")
            }
            .tag(1)
        }
        
    }
}

private struct Tab : View {
    
    let imageName : String
    let text: String
    
    var body : some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
    
}
