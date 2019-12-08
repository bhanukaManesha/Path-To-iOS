//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Bhanuka Gamage on 12/9/19.
//  Copyright © 2019 Bhanuka Gamage. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var rightDiceNumber: Int = 1;
    @State var leftDiceNumber : Int = 2;
    
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                
                
                Spacer()

                
                HStack {
                    DiceView(n:leftDiceNumber)
                    DiceView(n:rightDiceNumber)
                    
                }
                .padding(.horizontal)
                
                
                Spacer()
                
                Button(action: {
                    self.leftDiceNumber = Int.random(in:1...6)
                    self.rightDiceNumber = Int.random(in:1...6)
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
                
            }
            
        }
    }
}

struct DiceView: View {
    
    let n : Int
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1,contentMode: .fit)
            .padding(.all)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

