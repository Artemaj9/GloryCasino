//
//  GameLogic.swift
//

import SwiftUI
import Combine

class GameLogic: ObservableObject {
    
    @Published var size = CGSize(width: 393, height: 852)
    @Published var element = 4  // 1 -  Earth, 2 - Fire, 3 - Water, 4 - Air
    @Published var currentChest = 4
    @Published var isSound = false
    @Published var isPaused = false
    @Published var earthItems = Array(Array(repeating: false, count: 8))
    @Published var fireItems = Array(Array(repeating: false, count: 8))
    @Published var waterItems = Array(Array(repeating: false, count: 8))
    @Published var airItems = Array(Array(repeating: false, count: 8))
    
    @Published var balance = 5000
    
    @Published var earthWinItem = 3
    @Published var fireWinItem = 4
    @Published var waterWinItem = 8
    @Published var airWinItem = 7
    
    @Published var itemsMatrix = Array(repeating: Array(repeating: 1, count: 50), count: 5)
    @Published var currentMatrix = Array(repeating: Array(repeating: 1, count: 3), count: 5)
    
    @Published var earthJackpot = 0
    @Published var fireJackpot = 0
    @Published var waterJackpot = 0
    @Published var airJackpot = 0
    
    
    @Published var openChests = Array(repeating: false, count: 4)
    @Published var openCount = Array(repeating: 0, count: 4)
    
    @Published var newPosition: [CGFloat] = Array(repeating: 0, count: 5)
    
    

    
    func fillItems(isFirst: Bool) {
        for j in 0...4 {
            for i in 0...49 {
                if isFirst || i < 47 {
                    itemsMatrix[j][i] = randomNumber(probabilities: [0.2,1,1,1,1,1,1, 0.3, 0.3, 0.3]) + 1
                }
            }
        }
        print(itemsMatrix)
    }
    
    
    
    
    func itemToSumm(_ item: Int) -> Int {
        if item < 7 {
            return item * 500
        }
        if item == 7 { return 4000 }
        
        return 5000
    }
    
    
    
    func randomNumber(probabilities: [Double]) -> Int {
        let sum = probabilities.reduce(0, +)
        let rnd = Double.random(in: 0.0 ..< sum)
        var accum = 0.0
        
        for (i, p) in probabilities.enumerated() {
            accum += p
            if rnd < accum {
                return i 
            }
        }
        return (probabilities.count - 1)
    }
}
