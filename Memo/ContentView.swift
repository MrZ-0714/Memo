//
//  ContentView.swift
//  Memo
//
//  Created by Zimo Zhao on 4/26/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(0..<4) { index in
                HStack {
                    ForEach(0..<4)
                    { index in CardView(isFaceUp: false)
                    }
                }
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font(.largeTitle)
    }
}

struct CardView: View {
    var isFaceUp: Bool
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 20.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 20.0).stroke(lineWidth: 3.0)
                Text("🧜‍♀️")
            } else {
                RoundedRectangle(cornerRadius: 20.0).fill()
            }

        }
    }
}
