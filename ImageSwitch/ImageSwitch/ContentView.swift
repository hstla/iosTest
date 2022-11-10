//  ContentView.swift
//  ImageSwitch
//
//  Created by 황현성 on 2022/02/07.
//

import SwiftUI

struct ContentView: View {
    @State var page = 1
    let fullPage = 6
    
    var body: some View {
        VStack{
            HStack{
                TopButton(image: "arrow.left.circle") {
                                    page -= 1
                                } enablesIf: {
                                    page > 1
                                }
                
                Text("\(page)/\(fullPage)")
                    .frame(maxWidth:.infinity)
                    .font(.largeTitle)
                
                TopButton(image: "arrow.right.circle") {
                                    page += 1
                                } enablesIf: {
                                    page < fullPage
                                }
            }
            Spacer()
            Image("cat\(page)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight:.infinity)
        
    }
}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}


