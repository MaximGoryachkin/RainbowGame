//
//  MainButtons.swift
//  RainbowGame
//
//  Created by Daniil Kulikovskiy on 13.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("pngwing")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 35)
                
                VStack(spacing: 16) {
                    Text("НЛП Игра")
                        .font(.system(size: 36))
                    
                    Text("Радуга")
                        .font(.system(size: 36, weight: .bold))
                }
                .padding(.top, 6)
                .padding(.bottom, 20)
                
                VStack(spacing: 16) {
                    MainButton(text: "Новая игра",
                               color: .red, destination: ContentView())
                    MainButton(text: "Продолжить", color: .blue, destination: ContentView())
                    MainButton(text: "Статистика", color: .green, destination: ContentView())
                }
                .padding(.horizontal, 48)
                
                HStack {
                    OptionButton(image: "settings", destination: ContentView())
                    Spacer()
                    OptionButton(image: "question", destination: ContentView())
                }
                .padding(.top, 30)
                .padding(.horizontal, 28)
                .shadow(color: Color.black.opacity(0.2), radius: 3, y: 6)
            }
        }
    }
}

#Preview {
    ContentView()
}
