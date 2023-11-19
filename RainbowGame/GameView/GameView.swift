//
//  GameView.swift
//  RainbowGame
//
//  Created by Илья Шаповалов on 18.11.2023.
//

import SwiftUI
import Models
import Redux
import Core

struct GameView: View {
    @EnvironmentObject private var settings: SettingsModel
    
    //MARK: - Public properties
    let estimatedTime: String
    let gameSpeed: String
    let isPlaying: Bool
    @Binding var questions: [Question]
    let playButtonTap: () -> Void
    let onAppear: (Settings) -> Void
    let onDisappear: () -> Void
    
    //MARK: - body
    var body: some View {
        ZStack {
            settings.currentBackground
            ScrollViewReader { proxy in
                VStack {
                    ForEach($questions) { question in
                        QuestionCell(question: question)
                            .id(question.id)
                            .onAppear {
                                proxy.scrollTo(question.id)
                            }
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        SpeedButton(
                            title: gameSpeed,
                            tap: {},
                            longTap: {}
                        )
                    }
                }
            }
        }
        .navigationTitle(estimatedTime)
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: BackButton.init)
        .toolbar(content: playButton)
        .onAppear { 
            onAppear(
                .init(
                    gameTime: settings.timeGame,
                    speed: settings.speedSwitch,
                    selectedColors: settings.selectColors.compactMap(SelectColor.init),
                    isCellBackgroundEnabled: settings.isCellBackgroundEnabled
                )
            )
        }
        .onDisappear { onDisappear() }
    }
    
    //MARK: - Settings
    struct Settings {
        let gameTime: Double
        let speed: Int
        let selectedColors: [SelectColor]
        let isCellBackgroundEnabled: Bool
    }
    
}

private extension GameView {
    func playButton() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button(action: playButtonTap, label: playImage)
        }
    }
    
    func playImage() -> some View {
        Image(systemName: isPlaying
              ? "pause.circle"
              : "play.circle"
        )
        .tint(.black)
    }
    
    
}

struct GameViewConnector: Connector {
    func map(_ graph: Graph) -> some View {
        return GameView(
            estimatedTime: graph.game.estimatedTime,
            gameSpeed: graph.game.speed.description,
            isPlaying: graph.game.isPlaying, questions: Binding(
                get: { graph.game.questions },
                set: { graph.game.questions = $0 }
            ),
            playButtonTap: graph.game.isPlaying
            ? graph.game.pause
            : graph.game.play,
            onAppear: { settings in
                graph.game.set(gameTime: settings.gameTime)
                graph.game.speed = .init(rawValue: settings.speed) ?? .x1
                graph.settings.symbolColors = settings.selectedColors.map(\.color)
                graph.settings.selectedColors = settings.selectedColors.map(\.rawValue)
                graph.settings.backgroundColors = settings.selectedColors.map(\.color)
                graph.game.play()
            },
            onDisappear: {
                graph.game.quit()
            }
        )
    }
}

extension Question {
    static let sample: [Question] = [
        .init(isAnswered: true, colorName: "Green", symbolColor: .red, backgroundColor: .blue),
        .init(colorName: "Red", symbolColor: .green, backgroundColor: .gray),
        .init(colorName: "Blue", symbolColor: .red, backgroundColor: .cyan)
    ]
}

//#Preview {
//    NavigationView {
//        GameView(
//            estimatedTime: "00:11", 
//            gameSpeed: "x1",
//            questions: .constant(Question.sample),
//            isPlaying: .constant(true)
//        )
//        .environmentObject(SettingsModel())
//    }
//}
