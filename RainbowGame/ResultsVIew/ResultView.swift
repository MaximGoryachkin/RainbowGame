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
             results: "Угадано 5/5")
    ]
    
    
    
    var body: some View {
        List {
            ForEach(games) { game in
                Section {
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
            }
        }
        .navigationTitle("Статистика")
        .specialNavBar()
    }
}


//#Preview {
//    ResultView()
//}
