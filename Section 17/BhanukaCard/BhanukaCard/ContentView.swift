//
//  ContentView.swift
//  BhanukaCard
//
//  Created by Bhanuka Gamage on 12/9/19.
//  Copyright © 2019 Bhanuka Gamage. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(red:0.09, green:0.63, blue:0.52, opacity:1.0)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("bhanuka")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:150.0, height: 150.0)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                
                Text("Bhanuka Gamage")
                    .font(Font.custom("Pacifico-Regular", size:40))
                    .bold()
                    .foregroundColor(.white)
                
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                
                Divider()
                
                InfoView(text: "+60 17 689 4092", imageName: "phone.fill")
                InfoView(text: "bhanukamgamage@gmail.com", imageName: "envelope.fill")
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
