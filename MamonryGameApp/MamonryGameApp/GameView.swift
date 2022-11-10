//
//  GameView.swift
//  MamonryGameApp
//
//  Created by 황현성 on 2022/02/10.
//

import SwiftUI

struct GameView: View {
    let prefix: String
    @ObservedObject var game = GameModel()
    @Environment(\.presentationMode) var present
    @State var showsRestartAlert = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Memory Game")
                Spacer()
                Text("Flips: \(game.flips)")
            }
            .padding(.horizontal)
            GridStack(rows: GameModel.rows, columns: GameModel.cols) { row, col in
                CardView(prefix: prefix, card: game.card(row: row, col: col))
                    .gesture(TapGesture().onEnded {
                        game.toggle(row: row, col: col)
                        let card = game.card(row: row, col: col)
                        print("toggle \(row) \(col) \(card.state)")
                        if game.over {
                            showsRestartAlert = true
                        }
                    })
            }
            .aspectRatio(CGSize(width: GameModel.cols, height: GameModel.rows), contentMode: .fit)
            Spacer()
            HStack {
                Spacer()
                Button {
                    present.wrappedValue.dismiss()
                } label: {
                    Text("Back")
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .stroke(lineWidth: 2.0)
                        )
                }
                Spacer()
                Button {
                    showsRestartAlert = true
                } label: {
                    Text("Restart")
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .stroke(lineWidth: 2.0)
                        )
                }
                Spacer()
            }
            Spacer()
        }
        .background(
            LinearGradient(gradient:
                            Gradient(colors: [
                                .white,
                                .blue.opacity(0.5)
                            ]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing
            )
        )
        .alert(isPresented: $showsRestartAlert) {
            Alert(
                title: Text("Restart?"),
                message: Text("Do you want to restart the game?"),
                primaryButton: .default(Text("Restart")) {
                    game.start()
                },
                secondaryButton: .cancel()
            )
        }
        .navigationBarHidden(true)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(prefix: "f")
    }
}
