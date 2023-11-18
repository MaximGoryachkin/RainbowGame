//
//  GameView.swift
//  RainbowGame
//
//  Created by Илья Шаповалов on 18.11.2023.
//

import SwiftUI
import Models

struct GameView: View {
    @EnvironmentObject private var settings: SettingsModel
    
    let estimatedTime: String
    let gameSpeed: String
    @Binding var questions: [Question]
    @Binding var isPlaying: Bool
    
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
                            longTap: {})
                    }
                }
            }
        }
        .navigationTitle(estimatedTime)
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: BackButton.init)
        .toolbar(content: playButton)
    }
    
    func playButton() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button(
                action: { isPlaying.toggle() },
                label: playImage)
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

extension Question {
    static let sample: [Question] = [
        .init(isAnswered: true, colorName: "Green", symbolColor: .red, backgroundColor: .blue),
        .init(colorName: "Red", symbolColor: .green, backgroundColor: .gray),
        .init(colorName: "Blue", symbolColor: .red, backgroundColor: .cyan)
    ]
}

#Preview {
    NavigationView {
        GameView(
            estimatedTime: "00:11", 
            questions: .constant(Question.sample),
            isPlaying: .constant(true)
        )
        .environmentObject(SettingsModel())
    }
}
