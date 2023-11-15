//
//  QuestionDriver.swift
//  
//
//  Created by Илья Шаповалов on 15.11.2023.
//

import Foundation
import Combine
import Core
import OSLog

public final class QuestionDriver {
    private var cancellable: AnyCancellable?
    private let store: EnvironmentStore
    private var logger: Logger?
    
    //MARK: - init(_:)
    public init(
        store: EnvironmentStore,
        logger: Logger? = nil
    ) {
        self.store = store
        self.logger = logger
        self.logger?.log(level: .debug, #function)
        
        self.cancellable = store.$graph
            .sink(receiveValue: processGraph)
    }
    
    //MARK: - deinit
    deinit {
        cancellable = nil
    }
}

private extension QuestionDriver {
    //MARK: - Private methods
    func processGraph(_ graph: Graph) {
        guard graph.game.questions.isEmpty else { return }
        
    }
}
