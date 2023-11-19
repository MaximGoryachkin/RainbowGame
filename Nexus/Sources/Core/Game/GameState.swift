//
//  GameState.swift
//  
//
//  Created by Илья Шаповалов on 13.11.2023.
//

import Foundation
import Redux
import Models

public struct GameState: Reducer, Equatable {
    public var timeAmount: Int
    var score: Int
    var questions: [Question]
    public var speed: GameSpeed
    var isGameCheckEnabled: Bool
    public var isPlaying: Bool
    
    public var timeInMinutes: String {
        let minutes = timeAmount / 60
        let seconds = timeAmount % 60
        
        return [minutes.description,seconds.description].joined(separator: ":")
    }
    
    //MARK: - init(_:)
    public init(
        timeAmount: Int = .init(),
        score: Int = .zero,
        questions: [Question] = .init(),
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
    mutating public func reduce(_ action: Action) {
        switch action {
        case let action as GameActions.SetTimeAmount:
            timeAmount = action.time
            
        case let action as GameActions.AddQuestion:
            questions.append(action.question)
            
        case let action as GameActions.UpdateQuestions:
            questions = action.questions
            
        case is GameActions.TimerTick:
            timeAmount -= 1
            
        case is GameActions.Play:
            isPlaying = true
            
        case is GameActions.Pause:
            isPlaying = false
            
        case let action as GameActions.DidTapQuestionId:
            guard let questionIndex = questions.firstIndex(where: { $0.id == action.id }) else {
                assertionFailure("Всегда должен быть элемент по тапу")
                return
            }
            questions[questionIndex].isAnswered = true
            
        case let action as GameActions.ChangeSpeed:
            speed = action.speed
            
        case is GameActions.Quit:
            self = .init()
            
        default: break
        }
    }
}

extension GameState {
    //MARK: - GameSpeed
    public enum GameSpeed: Int {
        case x1 = 1
        case x2
        case x3
        case x4
        case x5
        
        public var description: String {
            switch self {
            case .x1: return "x1"
            case .x2: return "x2"
            case .x3: return "x3"
            case .x4: return "x4"
            case .x5: return "x5"
            }
        }
        
        public var cooldown: Int {
            switch self {
            case .x1: return 5
            case .x2: return 4
            case .x3: return 3
            case .x4: return 2
            case .x5: return 1
            }
        }
        
        public init() { self = .x1 }
    }
}
