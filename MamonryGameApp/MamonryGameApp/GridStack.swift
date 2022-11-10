//
//  GridStack.swift
//  MamonryGameApp
//
//  Created by 황현성 on 2022/02/10.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    var body: some View {
        VStack {
            ForEach (0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach (0 ..< columns, id: \.self) { column in
                        self.content(row, column)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
            }
        }
    }
}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        GridStack(rows: 4, columns: 3) { row, col in
            Text("\(row),\(col)")
        }
    }
}
