//
//  ContentView.swift
//  MapSample
//
//  Created by 황현성 on 2022/02/11.
//


import SwiftUI
import MapKit

struct ContentView: View {
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3410897, longitude: 126.7356769), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    var body: some View {
        VStack {
            Map(coordinateRegion: $region)
                .frame(width:.infinity, height: .infinity)
            Button {
                region.center.latitude += 0.001
            } label: {
                Text("Go North")
            }
            .padding()
            .background(Capsule().stroke(lineWidth: 3))
            .padding()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
