//
//  ContentView.swift
//  SUIAndUIKitSlider
//
//  Created by Nikita Batrakov on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 50
    @State private var isPresented = false
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            Button("Проверь меня!") {
                isPresented = true
            }
            .alert("Your Score", isPresented: $isPresented, actions: {}) {
                
            }
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
