//
//  MeSample.swift
//  MapSample
//
//  Created by 황현성 on 2022/02/11.
//

import SwiftUI

struct MeSample: View {
    var body: some View {
        NavigationView {
            List{
                ForEach(PoiData.rows, id: \.REPRSNT_FOOD_NM) { (poi: PoiItem) in
                    NavigationLink(destination: RestaurantViews(poiItem: poi)){
                        HStack {
                            Image(systemName: "fork.knife.circle")
                                .resizable()
                                .frame(width: 60, height: 60)
                            VStack {
                                Text(poi.RESTRT_NM)
                                    .font(.title)
                                Text(poi.REPRSNT_FOOD_NM)
                                    .font(.title)
                                Text(poi.REFINE_ROADNM_ADDR)
                                    .lineLimit(1)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MeSample_Previews: PreviewProvider {
    static var previews: some View {
        MeSample()
    }
}
