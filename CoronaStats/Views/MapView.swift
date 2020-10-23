//
//  MapView.swift
//  CoronaStats
//
//  Created by 김믿음 on 2020/09/12.
//  Copyright © 2020 김믿음. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit

struct MapView : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView()
    }

    @Binding var countryData : [CountryData]
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        // 코로나가 발생한 모든 지역에 핀 표기 하는것. 처음에는 빈 값으로 두고, countryData에서 값을 받아 넣는다.
        var allAnnotations : [CoronaCaseAnnotation] = []
        
        // 핀 아래 텍스트에 확진자와 사망자 표기!
        for data in countryData {
            // \n >> 다음줄에 표기
            let title = data.country + "\n Confirmed " + data.confirmed.formatNumber() + "\n Death " + data.deaths.formatNumber()
            
            let coordinate = CLLocationCoordinate2D(latitude: data.latitude, longitude: data.longitude)
            
            allAnnotations.append(CoronaCaseAnnotation(title: title, coordinate: coordinate))
        }
        
        uiView.annotations.forEach{uiView.removeAnnotation($0)}
        uiView.addAnnotations(allAnnotations)
    }
}

class CoronaCaseAnnotation : NSObject,MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
