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
        XCTAssertEqual(sut.amountOfTime, .zero)
        XCTAssertEqual(sut.speed, .one)
        XCTAssertFalse(sut.isGameCheckEnabled)
        XCTAssertEqual(sut.score, .zero)
        XCTAssertEqual(sut.questions.count, .zero)
    }
    
    func test_receiveTimerTick() {
        
    }
    
}
