//
//  SerchView.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/09/11.
//  Copyright © 2020 김믿음. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @Binding var searchText : String
    
    var body: some View {
        HStack {
            TextField("County...", text: $searchText)
            .padding()
        }
        
    .frame(height: 50)
    .background(Color("CardBackgroundGray"))
    }
}
