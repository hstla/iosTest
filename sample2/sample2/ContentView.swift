//  ContentView.swift
//  sample2
//
//  Created by 황현성 on 2022/02/07.
//
// MVC  - UIKit  ==> model View Viewcontroller
// MVVM - swiftUI  ==> model view viewModel
import SwiftUI

struct HelloMod: ViewModifier {
    func body(content: Content) -> some View {
        content              // 클래스안에 하나의 retrun만 있으면 retrun 생략가능
            .padding(20.0)
            .background(Color.blue)
            .border(Color.red, width: 8.0)
    }
}

struct ContentView: View {
    var body: some View {
        VStack{
            
            Text("Hello, world!")
                .bold()
                .padding(20.0)
                .background(Color.yellow)
                .border(Color.red, width:8.0)
            
            Image(systemName: "sun.and.horizon")
                .resizable()
                .frame(width: 100, height: 100)
            
            ZStack{
                Text("Hwang_Hyun_seong")
                    .bold()
                    .padding(10.0)
                    .background(Color.yellow)
                    .border(Color.blue, width:1.0)
                Image(systemName: "moon")
                    .resizable()
                    .frame(width: 200, height: 80)
                }
            Text("세로")
                .font(.largeTitle)
                .bold()
            Text("쌓기")
            
            HStack{
                Spacer()
                Text("가로")
                    .padding().background(Color.purple)
                
                Text("쌓기")
                    .fontWeight(.heavy)
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
