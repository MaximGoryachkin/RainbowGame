import XCTest
import Redux
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
    
    func test_recieveGameSpeedChange() {
        sut.reduce(GameActions.ChangeSpeed(.x2))
        
        XCTAssertEqual(sut.speed, .x2)
        
        sut.reduce(GameActions.ChangeSpeed(.x3))
        
        XCTAssertEqual(sut.speed, .x3)
        
        sut.reduce(GameActions.ChangeSpeed(.x4))
        
        XCTAssertEqual(sut.speed, .x4)
        
        sut.reduce(GameActions.ChangeSpeed(.x5))
        
        XCTAssertEqual(sut.speed, .x5)
    }
    
    
    
}
