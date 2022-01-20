//
//  ContentView.swift
//  RYGlights
//
//  Created by Mikhail Kamynin on 20.01.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    
    @State private var startGame = true
    @State private var opacityRed = 0.3
    @State private var opacityYellow = 0.3
    @State private var opacityGreen = 0.3
    @State private var currentLight = CurrentLight.red

    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                VStack {
                    Circle()
                        .foregroundColor(.red)
                        .opacity(opacityRed)
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    
                    Circle()
                        .foregroundColor(.yellow)
                        .opacity(opacityYellow)
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    
                    Circle()
                        .foregroundColor(.green)
                        .opacity(opacityGreen)
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                }
                .frame(height: 300)
                Spacer()
                
                Button(action: { startGame = false
                    currentLightMethod()
                }) {
                    startGame ? Text("START") : Text("NEXT")
                }
                
            }
        }
    }

    private func currentLightMethod() {
        switch currentLight {
        case .red:
            opacityRed = 1.0
            opacityYellow = 0.3
            opacityGreen = 0.3
            currentLight = .yellow
        case .yellow:
            opacityRed = 0.3
            opacityYellow = 1.0
            opacityGreen = 0.3
            currentLight = .green
        case .green:
            opacityRed = 0.3
            opacityYellow = 0.3
            opacityGreen = 1.0
            currentLight = .red
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
