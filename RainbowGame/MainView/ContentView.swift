//
//  MainButtons.swift
//  RainbowGame
//
//  Created by Daniil Kulikovskiy on 13.11.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settingsModel: SettingsModel
    var body: some View {
        NavigationView {
            ZStack {
                settingsModel.backgroundColor(defaultColor: settingsModel.defaultBackgroundColor)
                VStack {
                    Image("pngwing")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 35)
                    
                    VStack(spacing: 16) {
                        settingsModel.switchTextColor(colors: settingsModel.defaultBackgroundColor, text: "НЛП Игра")
                            .font(.system(size: 36, weight: .semibold, design: .rounded))
                        
                        settingsModel.switchTextColor(colors: settingsModel.defaultBackgroundColor, text: "Радуга")
                            .font(.system(size: 36, weight: .semibold, design: .rounded))
                    }
                    .padding(.top, 6)
                    .padding(.bottom, 20)
                    
                    VStack(spacing: 16) {
                        MainButton(text: "Новая игра",
                                   color: .red, destination: EmptyView())
                        MainButton(text: "Продолжить", color: .blue, destination: EmptyView())
                        MainButton(text: "Статистика", color: .green, destination: EmptyView())
                    }
                    .padding(.horizontal, 48)
                    
                    HStack {
                        OptionButton(image: "settings", destination: SettingsView())
                        Spacer()
                        OptionButton(image: "question", destination: RulesView())
                    }
                    .padding(.top, 30)
                    .padding(.horizontal, 28)
                    .shadow(color: Color.black.opacity(0.2), radius: 3, y: 6)
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
