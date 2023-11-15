//
//  GameNode.swift
//  
//
//  Created by Шаповалов Илья on 14.11.2023.
//

import Foundation
import Models

extension Graph {
    var game: GameNode { .init(graph: self) }
}

struct GameNode {
    private let graph: Graph
    
    var timeAmount: Double {
        get { graph.state.timeAmount }
        nonmutating set { graph.dispatch(GameActions.SetTimeAmount(newValue)) }
    }
    
    var questions: [Question] {
        get { graph.state.questions.map(\.value) }
        nonmutating set { graph.dispatch(GameActions.AddQuestions(newValue)) }
    }
    
    //MARK: - init(_:)
    init(graph: Graph) {
        self.graph = graph
    }
}
