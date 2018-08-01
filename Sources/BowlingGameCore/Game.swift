//
//  Game.swift
//  BowlingGameCore
//
//  Created by Jose A. Lobato on 31/07/2018.
//

import Foundation

class Game {
  private var rolls = Array(repeating: 0, count: 21)
  private var currentRoll: Int = 0
  
  func roll(pins: Int) {
    rolls[currentRoll] = pins
    currentRoll += 1
  }
  
  func score() -> Int {
    var currentScore: Int = 0
    var frameIndex = 0
    for _/*frame*/ in 0..<10 {
      var frameScore = 0
      if (isStrike(for: frameIndex)) {
        frameScore = 10 + rolls[frameIndex + 1] + rolls[frameIndex + 2]
        frameIndex += 1
      }
      else if(self.isSpare(for: frameIndex)) {
        frameScore = 10 + rolls[frameIndex + 2]
        frameIndex += 2
      }
      else {
        frameScore = rolls[frameIndex] + rolls[frameIndex + 1]
        frameIndex += 2
      }
      currentScore += frameScore
      
    }
    return currentScore
  }
  
  func isSpare(for frame: Int) -> Bool {
    let frameScore = rolls[frame] + rolls[frame + 1]
    return frameScore == 10
  }
  
  func isStrike(for frame: Int) -> Bool {
    return rolls[frame] == 10
  }
  
}
