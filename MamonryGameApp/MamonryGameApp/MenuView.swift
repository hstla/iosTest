//
//  MenuView.swift
//  MamonryGameApp
//
//  Created by 황현성 on 2022/02/11.
//
import SwiftUI

struct MenuView: View {
    let resourcePrefixes = [ "z", "f", "t" ]
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 10) {
                        ForEach (resourcePrefixes, id:\.self) { prefix in
                            MenuItemView(prefix: prefix)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.white, .orange.opacity(0.5)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .navigationBarTitle(Text("Memory Game"))
        }
    }
}
struct MenuItemView: View {
    let prefix: String
    var body: some View {
        HStack {
            Image("\(prefix)_back")
                .resizable()
                .frame(
                    width: UIScreen.main.bounds.width * 0.4,
                    height: UIScreen.main.bounds.width * 0.4)
            Spacer()
            NavigationLink(destination: GameView(prefix:prefix)) {
                Text("Play Game")
                    .padding()
                    .background(
                        Capsule()
                            .stroke(lineWidth: 4.0)
                    )
            }
            Spacer()
        }
        .frame(height: 240)
        .background(
            ZStack {
                Color.white//.opacity(0.2)
                    .cornerRadius(25)
                    .padding(20)
                Image("\(prefix)_bg")
                    .resizable()
                    .padding(50)
                    //.opacity(0.25)
            }
            .rotation3DEffect(.degrees(20), axis: (x: 0.0, y: -1.0, z: 0.0))
            .opacity(0.3)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .previewDevice("iPhone 13 Pro")
            .previewInterfaceOrientation(.portrait)
    }
}
