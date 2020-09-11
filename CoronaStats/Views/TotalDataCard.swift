//
//  TotalDataCard.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/09/11.
//  Copyright © 2020 김믿음. All rights reserved.
//

import SwiftUI

struct TotalDataCard: View {
    
    var number : String = "Err"
    var name: String = "Confirmed"
    var color : Color = .primary
    
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                Text(self.number)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(self.color)
                
                Text(self.name)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(self.color)
            } // End of Vstack
                .frame(width: geometry.size.width, height: 80, alignment: .center)
                .background(Color("CardBackgroundGray"))
                .cornerRadius(8.0)
            
        } // End of Geometry
    }
}

struct TotalDataCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalDataCard()
    }
}
