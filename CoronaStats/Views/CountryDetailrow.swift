//
//  CountryDetailrow.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/09/12.
//  Copyright © 2020 김믿음. All rights reserved.
//

import SwiftUI

struct CountryDetailrow: View {
    
    var number : String = "Err"
    var name: String = "Confirmed"
    var color : Color = .primary
    
    
    var body: some View {
        VStack {
            
            HStack {
                Text(self.name)
                    .font(.body)
                    .padding(5)
                
                Spacer()
                
                Text(self.number)
                    .font(.subheadline)
                .padding(5)
                .foregroundColor(color)
                
            }
            
            Divider()
            
        }
        .padding(.leading)
        .padding(.trailing)
        
    }
}

struct CountryDetailrow_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailrow()
    }
}
