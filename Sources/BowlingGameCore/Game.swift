//
//  Game.swift
//  BowlingGame
//
//  Created by Jose A. Lobato on 13/08/2018.
//

import Foundation
let maxNumberOfRolls = 21

class Game {
  var rolls: [Int] = Array(repeating: 0, count: maxNumberOfRolls)
  var rollIndex: Int = 0
  
  func roll(_ roll: Int) {
    rolls[rollIndex] = roll
    rollIndex += 1
  }
  
  func score() -> Int {
    var totalScore = 0
    
    var roll = 0
    for _ in 0..<10 {
      if self.isStrikeFor(roll) {
        totalScore += 10 + rolls[roll + 1] + rolls[roll + 2]
        roll += 1
      }
      else if self.isSpareFor(roll) {
        totalScore += 10 + rolls[roll + 2]
        roll += 2
      }
      else {
        totalScore += rolls[roll] + rolls[roll + 1]
        roll += 2
      }
    }
    
    return totalScore
  }
  
  func isSpareFor(_ roll: Int) -> Bool {
    return rolls[roll] + rolls[roll + 1] == 10
  }
  
  func isStrikeFor(_ roll: Int) -> Bool {
    return rolls[roll] == 10
  }
}
