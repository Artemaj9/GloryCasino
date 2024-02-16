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
    
    
    
    @Published var earthJackpot = 0
    @Published var fireJackpot = 0
    @Published var waterJackpot = 0
    @Published var airJackpot = 0
    
    
    
    @Published var openChests = Array(repeating: false, count: 4)
    
    @Published var openCount = Array(repeating: 0, count: 4)
    
    func itemToSumm(_ item: Int) -> Int {
        if item < 7 {
            return item * 500
        }
        if item == 7 { return 4000 }
        
        return 5000
    }
}
