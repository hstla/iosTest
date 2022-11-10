//
//  ContentView.swift
//  Gesturesample
//
//  Created by 황현성 on 2022/02/09.
//
// discrete vs continuous

import SwiftUI

struct ContentView: View {
    @State var angle = Angle.degrees(0.0)
    let tapgs = TapGesture()
        .onEnded{
            NSLog("tapped")
        }
    let longpressgr = LongPressGesture()
        .onEnded{ _ in
            NSLog("Long Pressed")
        }
    var body: some View {
//        let maggr = MagnificationGesture(minimumScaleDelta: 0)
        let gr = RotationGesture()
            .onChanged { value in
                print(value)
                self.angle = value
            }
            .onEnded { _ in
                print("Ended")
            }
        Text("Hello, world!")
            .frame(width: 200, height: 200, alignment: .center)
            .background(Color.yellow)
            .rotationEffect(self.angle)
            .gesture(gr)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
