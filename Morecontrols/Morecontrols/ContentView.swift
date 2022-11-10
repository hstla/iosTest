//
//  ContentView.swift
//  Morecontrols
//
//  Created by 황현성 on 2022/02/08.
//

import SwiftUI

struct ContentView: View {
    @State var mainText = ""
    @State var sliderValue = 180.0
    var body: some View {
        VStack {
            TextField("Hello,", text: $mainText)
            Text("Slider: \(sliderValue)")
                .rotationEffect(.init(degrees: sliderValue))
                .animation(.easeIn)
            Image(mainText)
                .frame(width: 80, height: 80)
            Slider(value: $sliderValue, in: 0 ... 360)
                .padding(.all)
            Button {
                sliderValue += 30
            } label: {
                Text("30 degree more")
            }
        }
    }
}
















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
