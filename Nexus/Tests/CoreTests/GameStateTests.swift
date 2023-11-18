import XCTest
import Redux
import Models
@testable import Core

final class GameStateTests: XCTestCase {
    private var sut: GameState!
    
    override func setUp() async throws {
        try await super.setUp()
        
        sut = .init()
    }
    
    override func tearDown() async throws {
        sut = nil
        
        try await super.tearDown()
    }
    
    func test_initialState() {
        XCTAssertEqual(sut.timeAmount, .zero)
        XCTAssertEqual(sut.speed, .x1)
        XCTAssertFalse(sut.isGameCheckEnabled)
        XCTAssertEqual(sut.score, .zero)
        XCTAssertEqual(sut.questions.count, .zero)
    }
    
    func test_receiveTimerTick_decreaseAmountOfTime() {
        sut.timeAmount = 2
        
        sut.reduce(GameActions.TimerTick())
        
        XCTAssertEqual(sut.timeAmount, 1)
        
        sut.reduce(GameActions.TimerTick())
        
        XCTAssertEqual(sut.timeAmount, .zero)
    }
    
    func test_setAmountOfTime() {
        sut.reduce(GameActions.SetTimeAmount(10))
        
        XCTAssertEqual(sut.timeAmount, 10)
    }
    
    func test_reduceGameSpeedAction() {
        sut.reduce(GameActions.ChangeSpeed(.x2))
        
        XCTAssertEqual(sut.speed, .x2)
        
        sut.reduce(GameActions.ChangeSpeed(.x3))
        
        XCTAssertEqual(sut.speed, .x3)
        
        sut.reduce(GameActions.ChangeSpeed(.x4))
        
        XCTAssertEqual(sut.speed, .x4)
        
        sut.reduce(GameActions.ChangeSpeed(.x5))
        
        XCTAssertEqual(sut.speed, .x5)
        
        sut.reduce(GameActions.ChangeSpeed(.x1))
        
        XCTAssertEqual(sut.speed, .x1)
    }
    
    func test_reduceAddQuestions() {
        let questions = [Question()]
        sut.reduce(GameActions.AddQuestions(questions))
        
        XCTAssertEqual(sut.questions, questions)
    }
    
    func test_reduceDidTapQuestionWithId_() {
        let question = Question()
        sut.reduce(GameActions.AddQuestions([question]))
        
        sut.reduce(GameActions.DidTapQuestionId(question.id))
        
        guard let tappedQuestion = sut.questions.first(where: { $0.id == question.id }) else {
            XCTFail("Invalid Setup")
            return
        }
        XCTAssertEqual(tappedQuestion.id, question.id)
        XCTAssertTrue(tappedQuestion.isAnswered)
    }
    
    func test_reducePlayAction() {
        sut.reduce(GameActions.Play())
        
        XCTAssertEqual(sut.isPlaying, true)
    }
    
    func test_reducePauseAction() {
        sut.isPlaying = true
        
        sut.reduce(GameActions.Pause())
        
        XCTAssertEqual(sut.isPlaying, false)
    }
    
}
