//
//  DetailView.swift
//  MapSample
//
//  Created by 황현성 on 2022/02/11.
//
import SwiftUI
import MapKit

struct MyItem: Identifiable {
    let id = UUID()
    let poiItem: PoiItem
}
struct DetailView: View {
    let poiItem: PoiItem
    @State var region: MKCoordinateRegion
    let items: [MyItem]
    init(poiItem: PoiItem) {
        self.poiItem = poiItem
        region = MKCoordinateRegion(
            center: poiItem.location,
            span: MKCoordinateSpan(
                latitudeDelta: 0.05,
                longitudeDelta: 0.05)
        )
        items = [
            MyItem(poiItem: poiItem),
        ]
    }
    var body: some View {
        GeometryReader { gr in
            ScrollView(.vertical) {
                VStack(alignment:.leading) {
                    VStack(alignment:.leading) {
                        HStack {
                            Image(systemName: "tram.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text(poiItem.SIGUN_NM)
                        }
                        HStack {
                            Image(systemName: "location.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text(poiItem.SIGUN_CD)
                        }
                        HStack {
                            Image(systemName: "fork.knife.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text(poiItem.REPRSNT_FOOD_NM)
                        }
                        HStack {
                            Image(systemName: "phone.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Button {
                                let strUrl = "tel://" + poiItem.TASTFDPLC_TELNO
                                guard let url = URL(string: strUrl) else { return }
                                UIApplication.shared.open(url)
                            } label: {
                                Text(poiItem.TASTFDPLC_TELNO)
                            }
                        }
                    }
                    .background(Color.purple.opacity(0.3))
                    .padding()

                   Map(coordinateRegion: $region,
                       annotationItems: items
                   ) { item in
                       MapMarker(
                        coordinate: item.poiItem.location,
                        tint: .red
                       )
                   }
                    .frame(
                        width: gr.size.width,
                        height: gr.size.height / 2
                    )
                }
                .navigationTitle(poiItem.RESTRT_NM)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

extension PoiItem {
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: Double(REFINE_WGS84_LAT)!,
            longitude: Double(REFINE_WGS84_LOGT)!
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("Cannot test now")
//            DetailView(poiItem: PoiData.rows[0])
        }
    }
}

