//
//  GameLogic.swift
//

import SwiftUI
import Combine

class GameLogic: ObservableObject {
    
    @Published var size = CGSize(width: 393, height: 852)
    @Published var element = 4  // 1 -  Earth, 2 - Fire, 3 - Water, 4 - Air
    @Published var isSound = false
    @Published var isPaused = false
}
