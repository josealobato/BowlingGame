import Foundation
import XCTest
@testable import BowlingGameCore

class BowlingGameTests: XCTestCase {
  var gameUT: Game!
  
  override func setUp() {
    self.gameUT = Game()
  }
  
  func rollMany(times: Int, pins: Int)
  {
    for _ in 1...times {
      gameUT.roll(pins: pins)
    }
  }
  
  func rollSpare()
  {
    self.gameUT.roll(pins: 5)
    self.gameUT.roll(pins: 5)
  }
  
  func testGuttenGame() {
    self.rollMany(times:20, pins: 0)
    XCTAssertEqual(gameUT.score(), 0)
  }
  
  func testAllOnes() {
    self.rollMany(times:20, pins: 1)
    XCTAssertEqual(gameUT.score(), 20)
  }
  
  func testOneSpare() {
    self.rollSpare()
    self.gameUT.roll(pins: 3)
    XCTAssertEqual(gameUT.score(), 16)
  }
  
  func testRollStrike() {
    self.gameUT.roll(pins: 10)
    self.gameUT.roll(pins: 3)
    self.gameUT.roll(pins: 4)
    XCTAssertEqual(gameUT.score(), 24)
  }
  
  func testPerfectGame() {
    self.rollMany(times: 12, pins: 10)
    XCTAssertEqual(gameUT.score(), 300)
  }
}
