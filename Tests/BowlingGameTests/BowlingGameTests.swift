import Foundation
import XCTest
@testable import BowlingGameCore

class BowlingGameTests: XCTestCase {
  var game: Game!
  
  override func setUp() {
    self.game = Game()
  }
  
  private func rollMany(times: Int, pins: Int) {
    for _ in 0..<times {
      self.game.roll(pins)
    }
  }
  
  private func rollSpare() {
    self.game.roll(5)
    self.game.roll(5)
  }
  private func rollStrike() {
    self.game.roll(10)
  }
  
  func testGutterGame() {
    self.rollMany(times: 20, pins: 0)
    XCTAssertEqual(self.game.score(), 0)
  }
  
  func testAllOnes() {
    rollMany(times: 20, pins: 1)
    XCTAssertEqual(self.game.score(), 20)
  }
  
  func testSpare() {
    self.rollSpare()
    self.game.roll(3)
    self.rollMany(times: 17, pins: 0)
    XCTAssertEqual(self.game.score(), 16)
  }
  
  func testStrike() {
    self.rollStrike()
    self.game.roll(3)
    self.game.roll(4)
    self.rollMany(times: 16, pins: 0)
    XCTAssertEqual(self.game.score(), 24)
  }
  
  func testPerfectGame() {
    rollMany(times: 12, pins: 10)
    XCTAssertEqual(self.game.score(), 300)
  }
}
