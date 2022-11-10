//
//  ContentView.swift
//  MamonryGameApp
//
//  Created by 황현성 on 2022/02/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CardView(prefix: "f", card: Card(state: .open, number: 1))
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
