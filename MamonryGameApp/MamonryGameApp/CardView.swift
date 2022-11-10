//
//  CardView.swift
//  MamonryGameApp
//
//  Created by 황현성 on 2022/02/10.
//
import SwiftUI

struct CardView: View {
    let prefix: String
    let card: Card
    let count: Int
    init(prefix: String, card: Card) {
        self.prefix = prefix
        self.card = card
        if prefix == "z" {
            count = card.number == 10 ? 4 : 18
        } else {
            count = 8
        }
    }
    @State var frameIndex = 1
    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        if card.state == .removed {
            Image(systemName: "x.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.1)
        } else {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onReceive(timer) { _ in
                    frameIndex = frameIndex < count ? frameIndex + 1 : 1
                }
        }
    }
    var imageName: String {
        if card.state == .closed { return prefix + "_back" }
        let name = prefix + String(format: "_%02d_%02d", card.number, frameIndex)
        return name
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                CardView(prefix: "f", card: Card(state: .open, number: 1))
                CardView(prefix: "f", card: Card(state: .closed, number: 1))
                CardView(prefix: "f", card: Card(state: .removed, number: 1))
            }
            HStack {
                CardView(prefix: "f", card: Card(state: .open, number: 2))
                CardView(prefix: "f", card: Card(state: .closed, number: 2))
                CardView(prefix: "f", card: Card(state: .removed, number: 2))
            }
        }
    }
}
