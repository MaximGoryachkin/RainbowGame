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
    var timeAmount: Double {
        get { graph.state.timeAmount }
        nonmutating set { graph.dispatch(GameActions.SetTimeAmount(newValue)) }
    }
    
    public var isPlaying: Bool { graph.state.isPlaying }
    
    var questions: [Question] {
        get { graph.state.questions.map(\.value) }
        nonmutating set { graph.dispatch(GameActions.AddQuestions(newValue)) }
    }
    
    var speed: GameState.GameSpeed {
        get { graph.state.speed }
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
    
}
