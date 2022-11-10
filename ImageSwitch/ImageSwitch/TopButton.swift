//
//  TopButton.swift
//  ImageSwitch
//
//  Created by 황현성 on 2022/02/08.
//

import SwiftUI

struct TopButton: View {
    var image:String
    var action: ()-> Void
    var enablesIf: () -> Bool
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: image)
                    .resizable()
                    .foregroundColor(enablesIf() ? .blue : .gray)
                    .frame(width: 60, height:60, alignment: .center)
                    .padding(4)
        }.disabled(!enablesIf())
    }
}


struct TopButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            TopButton(image: "chevron.left.circle", action:{}, enablesIf:{true})
            TopButton(image: "chevron.right.circle", action:{}, enablesIf:{true})
            }
    }
}
