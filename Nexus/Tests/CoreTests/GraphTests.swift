//
//  GraphTests.swift
//  
//
//  Created by Шаповалов Илья on 14.11.2023.
//

import XCTest
import Models
import Redux
@testable import Core

final class GraphTests: XCTestCase {
    private var sut: Graph!
    private var action: Action!
    
    override func setUp() async throws {
        try await super.setUp()
        
        sut = .init(GameState(), dispatch: { action in
            self.action = action
            }
        )
    }
    
    override func tearDown() async throws {
        action = nil
        sut = nil
        
        try await super.tearDown()
    }
    
    func test_setTimeAmount_emitGameActionSetTime() {
        sut.game.timeAmount = 10
        
        let action = action as? GameActions.SetTimeAmount
        XCTAssertEqual(
            action,
            GameActions.SetTimeAmount(10)
        )
    }
    
    func test_setQuestions_emitAddQuestionsAction() {
        let questions = [Question()]
        sut.game.questions = questions
        
        let action = action as? GameActions.AddQuestions
        XCTAssertEqual(
            action,
            GameActions.AddQuestions(questions)
        )
    }
    
    
    
}
