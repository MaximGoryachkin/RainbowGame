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
        
        sut = .init(AppState(), dispatch: { action in
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
        sut.gameNode.timeAmount = 10
        
        let action = action as? GameActions.SetTimeAmount
        XCTAssertEqual(
            action,
            GameActions.SetTimeAmount(10)
        )
    }
    
    func test_setQuestions_emitAddQuestionsAction() {
        let questions = [Question()]
        sut.gameNode.questions = questions
        
        let action = action as? GameActions.AddQuestions
        XCTAssertEqual(
            action,
            GameActions.AddQuestions(questions)
        )
    }
    
    func test_setSpeed_emitSetSpeedAction() {
        sut.gameNode.speed = .x2
        
        let action = action as? GameActions.ChangeSpeed
        XCTAssertEqual(
            action,
            GameActions.ChangeSpeed(.x2)
        )
    }
    
    func test_playAction() {
        sut.gameNode.play()
        
        XCTAssertTrue(action is GameActions.Play)
    }
    
    func test_pauseAction() {
        sut.gameNode.pause()
        
        XCTAssertTrue(action is GameActions.Pause)
    }
    
    func test_timerTick() {
        sut.gameNode.timerTick()
        
        XCTAssertTrue(action is GameActions.TimerTick)
    }
    
}
