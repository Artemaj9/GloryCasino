//
//  PayoutLogic.swift
//

import Foundation

// Define symbols
enum Symbol: String {
    case cherry = "🍒"
    case bell = "🔔"
    case diamond = "💎"
    // Add more symbols as needed
}

// Define slot machine structure
struct SlotMachine {
    let reels: [[Symbol]] // 3 horizontal lines and 5 vertical lines
    let payoutTable: [Symbol: Int] // Payouts for different symbols
    let horizontalLines: Int = 3
    let verticalLines: Int = 5
    
    init(reels: [[Symbol]], payoutTable: [Symbol: Int]) {
        self.reels = reels
        self.payoutTable = payoutTable
    }
    
    // Calculate payout based on the current state of the slot machine
    func calculatePayout() -> Int {
        var totalPayout = 0
        
        // Check horizontal lines
        for i in 0..<horizontalLines {
            let symbolsInLine = Set(reels[i])
            for symbol in symbolsInLine {
                if symbolsInLine.filter({ $0 == symbol }).count == 3 { // Three of the same symbol in a line
                    if let payout = payoutTable[symbol] {
                        totalPayout += payout
                    }
                }
            }
        }
        
        // Check vertical lines
        for j in 0..<verticalLines {
            var symbolsInLine: [Symbol] = []
            for i in 0..<horizontalLines {
                symbolsInLine.append(reels[i][j])
            }
            for symbol in Set(symbolsInLine) {
                if symbolsInLine.filter({ $0 == symbol }).count == 3 { // Three of the same symbol in a line
                    if let payout = payoutTable[symbol] {
                        totalPayout += payout
                    }
                }
            }
        }
        
        return totalPayout
    }
}

// Example usage
let reels: [[Symbol]] = [
    [.cherry, .bell, .cherry, .diamond, .cherry],
    [.bell, .diamond, .bell, .cherry, .diamond],
    [.diamond, .cherry, .diamond, .bell, .bell]
]

let payoutTable: [Symbol: Int] = [
    .cherry: 10,
    .bell: 20,
    .diamond: 50
]

let slotMachine = SlotMachine(reels: reels, payoutTable: payoutTable)
let totalPayout = slotMachine.calculatePayout()
//print("Total Payout: \(totalPayout)")
