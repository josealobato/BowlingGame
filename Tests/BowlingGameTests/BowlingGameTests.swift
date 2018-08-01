import Foundation
import XCTest
@testable import BowlingGameCore

class BowlingGameTests: XCTestCase {
  var gameUT: Game!
  
  override func setUp() {
    self.gameUT = Game()
  }
  
  private func rollManny(times:Int, pins: Int) {
    for _ in 0..<times {
      self.gameUT.roll(pins: pins)
    }
  }
  
  private func rollSpare() {
    self.gameUT.roll(pins: 5)
    self.gameUT.roll(pins: 5)
  }
  
  private func rollStrike() {
    self.gameUT.roll(pins: 10)
  }
  
  func testGutterGame() {
    // Execute
    self.rollManny(times:20, pins:0)
    XCTAssertEqual(self.gameUT.score(), 0)
  }
  
  func testAllOnes() {
    // Execute
    self.rollManny(times:20, pins:1)
    XCTAssertEqual(self.gameUT.score(), 20)
  }
  
  func testOneSpare() {
    // Execute
    self.rollSpare()
    self.gameUT.roll(pins: 3)
    self.rollManny(times: 17, pins: 0)
    XCTAssertEqual(self.gameUT.score(), 16)
  }
  
  func testOneStrike() {
    // Execute
    self.rollStrike()
    self.gameUT.roll(pins: 3)
    self.gameUT.roll(pins: 4)
    XCTAssertEqual(self.gameUT.score(), 24)
  }
  
  func testPerfectGame() {
    self.rollManny(times: 12, pins: 10)
    XCTAssertEqual(self.gameUT.score(), 300)
  }

}
