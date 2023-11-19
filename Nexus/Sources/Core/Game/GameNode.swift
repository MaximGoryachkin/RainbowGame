//
//  GameNode.swift
//  
//
//  Created by Шаповалов Илья on 14.11.2023.
//

import Foundation
import Models

extension Graph {
    public var game: GameNode { .init(graph: self) }
}

public struct GameNode {
    private let graph: Graph
    
    //MARK: - init(_:)
    init(graph: Graph) {
        self.graph = graph
    }
    
    //MARK: - interface
    public var estimatedTime: String { graph.gameState.timeInMinutes }
    
    public var isPlaying: Bool { graph.gameState.isPlaying }
    
    public var questions: [Question] {
        get { graph.gameState.questions }
        nonmutating set { graph.dispatch(GameActions.UpdateQuestions(newValue)) }
    }
    
    public var speed: GameState.GameSpeed {
        get { graph.gameState.speed }
        nonmutating set { graph.dispatch(GameActions.ChangeSpeed(newValue)) }
    }
    
    public func play() {
        graph.dispatch(GameActions.Play())
    }
    
    public func pause() {
        graph.dispatch(GameActions.Pause())
    }
    
    public func timerTick() {
        graph.dispatch(GameActions.TimerTick())
    }
    
    public func add(question: Question) {
        graph.dispatch(GameActions.AddQuestion(question))
    }
    
    public func set(gameTime: Double) {
        let timeInSeconds = Int(gameTime * 60)
        graph.dispatch(GameActions.SetTimeAmount(timeInSeconds))
    }
    
}
