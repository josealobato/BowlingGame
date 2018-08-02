//
//  Game.swift
//  BowlingGame
//
//  Created by Jose A. Lobato on 02/08/2018.
//

import Foundation

class Game {
  private let numberOfFrames = 10
  private let numberOfRolls = 10 * 2
  private let numberOfTotalRools = 10 * 2 + 1
  private var rolls : [Int]
  var currentRoll = 0
  
  init() {
    self.rolls = Array(repeating: 0, count: numberOfTotalRools)
  }
  
  func roll(pins: Int)
  {
    if(self.currentRoll < 21) {
      rolls[currentRoll] = pins
      currentRoll += 1
    }
  }
  
  func isSpare(forFrame frameIndex: Int) -> Bool {
    return rolls[frameIndex] + rolls[frameIndex + 1] == 10
  }
  
  func isStrike(forFrame frameIndex: Int) -> Bool {
    return rolls[frameIndex] == 10
  }
  
  func spareBonus(forFrame frameIndex: Int) -> Int {
    return rolls[frameIndex + 2]
  }
  
  func strikeBonus(forFrame frameIndex: Int) -> Int {
    return rolls[frameIndex + 1] + rolls[frameIndex + 2]
  }
  
  func sumOfBallsInFrame(forFrame frameIndex: Int) -> Int {
    return rolls[frameIndex] + rolls[frameIndex + 1]
  }
  
  func score() -> Int
  {
    var scoreTotal = 0
    var frameIndex = 0
    for _ in 0..<numberOfFrames {
      if(self.isStrike(forFrame: frameIndex)) {
        scoreTotal += 10 + strikeBonus(forFrame: frameIndex)
        frameIndex += 1
      }
      else if(isSpare(forFrame: frameIndex)) {
        scoreTotal += 10 + spareBonus(forFrame: frameIndex)
        frameIndex += 2
      }
      else {
        scoreTotal += sumOfBallsInFrame(forFrame: frameIndex)
        frameIndex += 2
      }
    }
    return scoreTotal
  }
  
}

