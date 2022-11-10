//
//  ContentView.swift
//  AnimationSample
//
//  Created by 황현성 on 2022/02/09.
//

import SwiftUI

struct ContentView: View {
//    @State var angle = Angle.degrees(0)
    @State var spinning = false
    @State var scale = CGFloat(1.0)
    @State var visible = false
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth:  2)
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100, alignment: .center)
                Image(systemName: "forward.fill")
                    .font(.largeTitle)
                    .offset(y: -50)
                    .rotationEffect(.degrees(spinning ? 360 : 0))
                    .animation(
                        .linear(duration: 2)
                            .repeatForever(autoreverses: false),
                        value: spinning ? 360 : 0
                    )
                }
            .scaleEffect(scale)
            .animation(.spring(response:1, dampingFraction: 0, blendDuration: 0), value: scale)
            .onAppear {
                spinning = true
            }
            Spacer()
            Toggle(isOn: $visible.animation(.linear)) {
                Text("Toggle Text views")
                    .font(.title)
            }
            .padding()
            Button {
                if scale < 2.8 {
                    scale += 0.3
                } else {
                    scale = 1
                }
            } label: {
                Text("!Hit Me!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
                    .border(Color.purple, width: 2)
            }
            if (visible) {
                Text("slide").font(.largeTitle)
                    .transition(.slide)
            } else {
                Text("scale").font(.largeTitle)
                    .transition(.scale)
            }
            if (visible) {
                Text("Move-Top").font(.largeTitle)
                    .transition(.move(edge: .top))
            } else {
                Text("Move-Leading").font(.largeTitle)
                    .transition(.move(edge: .leading))
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
