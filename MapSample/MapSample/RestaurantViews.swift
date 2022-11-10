//
//  RestaurantViews.swift
//  MapSample
//  Created by 황현성 on 2022/02/11.
//

import SwiftUI
import MapKit

struct RestaurantViews: View {
    init(poiItem: PoiItem) {
        self.poiItem
    }
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3410897, longitude: 126.7356769),span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    var body: some View {
        ScrollView {
            VStack {
                Text(poiItem.SIGUN_NM)
                Text(poiItem.SIGUN_CD)
                Text(poiItem.REPRSNT_FOOD_NM)
                Button {
                    let strUrl = "tell://" + poiItem.TASTFDPLC_TELNO
                    guard let url = URL(string: strUrl) else {return}
                    UIApplication.shared.open(url)
                } label: {
                    Text(poiItem.TASTFDPLC_TELNO)
                }
                
                Map(coordinateRegion: $region)
                    .frame(width: .infinity, height: .infinity)
            }
            .navigationTitle(poItem.RESTRT_NM)
            .navigationBarTitleDisplayMode(.inline)
    }
    }
}

struct RestaurantViews_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantViews(poiItem.RESTRT_NM)
    }
}
