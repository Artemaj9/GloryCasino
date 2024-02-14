//
//  GameLogic.swift
//

import SwiftUI
import Combine

class GameLogic: ObservableObject {
    
    @Published var size = CGSize(width: 393, height: 852)
    @Published var element = 1  // 1 -  Earth, 2 - Fire, 3 - Water, 4 - Air
    @Published var isSound = false
    @Published var isPaused = false
    @Published var earthItems = Array(Array(repeating: false, count: 8))
    @Published var fireItems = Array(Array(repeating: false, count: 8))
    @Published var waterItems = Array(Array(repeating: false, count: 8))
    @Published var airItems = Array(Array(repeating: false, count: 8))
}
