//
//  Game.swift
//  applePie
//
//  Created by student on 15/04/24.
//

import Foundation

struct Game{
    var word:String
    var incorrectMovesRemaining:Int
    
    var guessedLetters: [Character]
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_ "
            }
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character) {
      guessedLetters.append(letter)
      if !word.contains(letter) {
        incorrectMovesRemaining -= 1
      }
    }
}

