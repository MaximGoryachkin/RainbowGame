//
//  ResultView.swift
//  RainbowGame
//
//  Created by Максим Горячкин on 17.11.2023.
//

import SwiftUI

struct ResultView: View {
    struct Game: Identifiable {
        let id = UUID()
        let number: String
        let time: String
        let speed: String
        let results: String
    }
    
    let games = [
        Game(number: "Игра №1",
             time: "Время 11.0",
             speed: "Скорость х2",
             results: "Угадано 5/5"),
        Game(number: "Игра №1",
             time: "Время 11.0",
             speed: "Скорость х2",
             results: "Угадано 5/5"),
        Game(number: "Игра №1",
             time: "Время 11.0",
             speed: "Скорость х2",
             results: "Угадано 5/5"),
        Game(number: "Игра №1",
             time: "Время 11.0",
             speed: "Скорость х2",
             results: "Угадано 5/5"),
        Game(number: "Игра №1",
             time: "Время 11.0",
             speed: "Скорость х2",
             results: "Угадано 5/5"),
        Game(number: "Игра №1",
             time: "Время 11.0",
             speed: "Скорость х2",
             results: "Угадано 5/5"),
        Game(number: "Игра №1",
             time: "Время 11.0",
             speed: "Скорость х2",
             results: "Угадано 5/5"),
        Game(number: "Игра №1",
             time: "Время 11.0",
             speed: "Скорость х2",
             results: "Угадано 5/5")
    ]
    
    @EnvironmentObject private var settingsObject: SettingsModel
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            List {
                ForEach(games) { game in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(game.number)
                                .foregroundStyle(.gameTitle)
                            Spacer()
                            Text(game.time)
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(game.speed)
                            Spacer()
                            Text(game.results)
                                .foregroundStyle(.resultTitle)
                                .font(.system(size: 20).bold())
                        }
                    }
                    .font(.system(size: 20))
                    
                }
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color(UIColor.systemBackground))
                )
            }
            .listStyle(.plain)
            .padding()
            .listRowSpacing(25)
            
            Button {
                // очищает статистику
            } label:  {
                Text("Очистить статистику")
                    .font(.system(size: 20))
            }
            .frame(width: 268, height: 63)
            .background(.red)
            .foregroundStyle(.white)
            .cornerRadius(10)
            Spacer()
        }
        .shadow(color: Color.black.opacity(0.2), radius: 3, y: 6)
        .navigationTitle("Статистика")
        .specialNavBar(with: settingsObject.currentBackground, complition: {
            presentationMode.wrappedValue.dismiss()
        })
        .preferredColorScheme(settingsObject.colorScheme)
        .background(settingsObject.backgroundColor())
    }
}



#Preview {
    ResultView()
        .environmentObject(SettingsModel())
}
