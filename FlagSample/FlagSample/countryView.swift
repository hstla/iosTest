//
//  countryView.swift
//  FlagSample
//
//  Created by 황현성 on 2022/02/09.
//

import SwiftUI

struct CountryView: View {
    let country:(name:String, file:String)
    var body: some View {
        HStack() {
            Image(country.file)
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
            VStack(alignment:.leading) {
                Text(country.name)
                Text("\(country.name.count * 2344320)")
                    .foregroundColor(.brown)
            }
        }
//        .frame(height:64)
//        .frame(maxWidth:.infinity)
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(country: (name: "대한민국", file: "south_korea"))
    }
}
