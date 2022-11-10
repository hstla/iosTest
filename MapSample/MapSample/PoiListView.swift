//
//  PoiListView.swift
//  MapSample
//
//  Created by 황현성 on 2022/02/11.
//

import SwiftUI

struct PoiListView: View {
    @ObservedObject var poiData = PoiData()
    var body: some View {
        NavigationView {
            List {
                ForEach(poiData.rows, id: \.REPRSNT_FOOD_NM) { (poi: PoiItem) in
                    NavigationLink(destination: DetailView(poiItem: poi)) {
                        HStack {
                            Image(systemName: "fork.knife.circle")
                                .resizable()
                                .frame(width: 60, height: 60)
                            VStack(alignment: .leading) {
                                Text(poi.RESTRT_NM)
                                    .font(.title)
                                Text(poi.REPRSNT_FOOD_NM)
                                    .font(.headline)
                                    .foregroundColor(.brown)
                                Text(poi.REFINE_ROADNM_ADDR)
                                    .lineLimit(1)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Restaurants"))
        }
        .onAppear {
            poiData.startLoading()
        }
    }
}

struct PoiListView_Previews: PreviewProvider {
    static var previews: some View {
        PoiListView()
    }
}
