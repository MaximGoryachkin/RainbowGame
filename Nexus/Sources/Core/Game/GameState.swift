//
//  GameState.swift
//  
//
//  Created by Илья Шаповалов on 13.11.2023.
//

import Foundation
import Redux
import Models

struct GameState: Reducer {
    var timeAmount: Double
    var score: Int
    var questions: [Question.ID: Question]
    var speed: GameSpeed
    var isGameCheckEnabled: Bool
    var isPlaying: Bool
    
    //MARK: - init(_:)
    init(
        timeAmount: Double = .init(),
        score: Int = .zero,
        questions: [Question.ID: Question] = .init(),
        speed: GameSpeed = .init(),
        isGameCheckEnabled: Bool = false,
        isPlaying: Bool = false
    ) {
        self.timeAmount = timeAmount
        self.score = score
        self.questions = questions
        self.speed = speed
        self.isGameCheckEnabled = isGameCheckEnabled
        self.isPlaying = isPlaying
    }
    
    //MARK: - Reduce
    mutating func reduce(_ action: Action) {
        switch action {
        case let action as GameActions.SetTimeAmount:
            timeAmount = action.time
            
        case let action as GameActions.AddQuestions:
            action.questions.forEach { question in
                questions.updateValue(question, forKey: question.id)
            }
            
        case is GameActions.TimerTick:
            timeAmount -= 1
            
        case is GameActions.Play:
            isPlaying = true
            
        case is GameActions.Pause:
            isPlaying = false
            
        case let action as GameActions.DidTapQuestionId:
            guard let tappedQuestion = questions.removeValue(forKey: action.id) else {
                assertionFailure("Всегда должен быть элемент по тапу")
                return
            }
            let answeredQuestion = Question(
                id: tappedQuestion.id,
                isAnswered: true
            )
            questions.updateValue(answeredQuestion, forKey: answeredQuestion.id)
            
        case let action as GameActions.ChangeSpeed:
            speed = action.speed
            
        default: break
        }
    }
}

extension GameState {
    //MARK: - GameSpeed
    enum GameSpeed: Int {
        case x1 = 1
        case x2
        case x3
        case x4
        case x5
        
        init() { self = .x1 }
    }
}
