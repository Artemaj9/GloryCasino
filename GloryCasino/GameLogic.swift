//
//  GameLogic.swift
//

import SwiftUI
import Combine

class GameLogic: ObservableObject {
    
    @Published var size = CGSize(width: 393, height: 852)
    @Published var element = 4  // 1 -  Earth, 2 - Fire, 3 - Water, 4 - Air
    @Published var currentChest = 4
    @Published var isSound = true
    @Published var isPaused = false
    @Published var earthItems = Array(Array(repeating: false, count: 8))
    @Published var fireItems = Array(Array(repeating: false, count: 8))
    @Published var waterItems = Array(Array(repeating: false, count: 8))
    @Published var airItems = Array(Array(repeating: false, count: 8))
    @AppStorage("lastdate") var lastDate = Int(Date().timeIntervalSince1970)
    @Published var nowDate = Date()
    @AppStorage("balance") var balance = 5000
    @Published var isGame = false
    
    @Published var allItems = Array(repeating: Array(repeating: false, count: 8), count: 4)
    
    @Published var betlimit = [400, 400, 400, 400]

    @Published var winItem = 0
    @Published var showWinItem = false
    @Published var showkey = false
    
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
    @Published var bet: Double = 500
    @Published var winCoef = 1.5
    @Published var totalWin = [2500, 3500, 4500, 5500]
    @Published var jackpots = [50000, 50000, 50000, 50000]
    
    
    @Published var openChests = Array(repeating: false, count: 4)
    @Published var openCount = Array(repeating: 0, count: 4)
    
    // Slot Geometry
    @Published var newPosition: [CGFloat] = Array(repeating: 0, count: 5)
    @Published var luckyHLines = [false, false, false]
    @Published var luckyVlines = [false, false, false, false, false]
    @Published var luckyVShapes = [false, false]
    
    
    func resetLuckyLines() {
        luckyHLines = [false, false, false]
        luckyVlines = [false, false, false, false, false]
        luckyVShapes = [false, false]
    }
    
    func getBonus() {
       
        print("Last Date: \(lastDate)")
        print("Now Date \(nowDate)")
        let cData = Date(timeIntervalSince1970: TimeInterval(lastDate))
        print("interval: \(Int(cData.timeIntervalSince(nowDate)))")
        if abs(Int(cData.timeIntervalSince(nowDate))) > 86400 {
            balance += 1000
            print("balance updated!")
            lastDate = Int(Date().timeIntervalSince1970)
        }
    }
    
    

    
    func fillItems(isFirst: Bool) {
        for j in 0...4 {
            for i in 0...49 {
                if isFirst || i < 47 {
                    itemsMatrix[j][i] = randomNumber(probabilities: [0.5,0.8,1,1,2, 2.5, 2.5, 3, 3, 3]) + 1
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

    func calculatePayout() -> Int {
        var totalPayout = 0
        
        
        // Check V shapes in Matrix
        // Check vertical lines
        for i in 0..<5 {
            let symbolsInLine = Set(currentMatrix[i])
            for symbol in symbolsInLine {
                
                
                
                if currentMatrix[i].filter({ $0 == symbol }).count == 2 && symbol == 1 {
                    
                    print("Победитель по вертикали x2: \(symbol)! Вертикаль \(i)")
                    luckyVlines[i] = true
                    totalPayout +=  Int(0.5 * bet)
                }
                
                if currentMatrix[i].filter({ $0 == symbol }).count == 3 { // Three of the
                    
                    print("Победитель по вертикали x3: \(symbol)! Вертикаль \(i)")
                    luckyVlines[i] = true
                    totalPayout +=  Int(payoutTable[symbol-1][0] * bet)
                }
            }
        }
        
        // Check vertical lines
        for j in 0..<3 {
            var symbolsInLine: [Int] = []
            for i in 0..<5 {
                symbolsInLine.append(currentMatrix[i][j])
            }
            for symbol in Set(symbolsInLine) {
                
                if symbolsInLine.filter({ $0 == symbol }).count == 2 && symbol == 1 {
                    totalPayout +=  Int(0.5 * bet)
                    luckyHLines[j] = true
                    print("Победитель по горизонтали x2: \(symbol)!  Горизонталь \(j)")
                }
                
                if symbolsInLine.filter({ $0 == symbol }).count == 3 {
                    totalPayout +=  Int(payoutTable[symbol-1][0] * bet)
                    print("Победитель по горизонтали x3: \(symbol)!  Горизонталь \(j)")
                }
                
                if symbolsInLine.filter({ $0 == symbol }).count == 4 {
                    print("Победитель по горизонтали x4: \(symbol)!  Горизонталь \(j)")
                    totalPayout +=  Int(payoutTable[symbol-1][1] * bet)
                }
                
                if symbolsInLine.filter({ $0 == symbol }).count == 5 {
                    print("Победитель по горизонтали x5: \(symbol)!  Горизонталь \(j)")
                    totalPayout +=  Int(payoutTable[symbol-1][2] * bet)
                }
                
                if symbolsInLine.filter({ $0 == symbol }).count >= 3 {
                    luckyHLines[j] = true
                }
            }
        }
        
      
        var vShape: [Int] = []
        for i in 0..<5 {
            for j in 0..<3 {
                if i<=2 && i == j {
                    vShape.append(currentMatrix[i][j])
                }
                if i > 2 && (i+j == 4) {
                    vShape.append(currentMatrix[i][j])
                }
            }
        }
        
        print("Vshape: \(vShape)")
                
                for symbol in Set(vShape) {
                    if vShape.filter({ $0 == symbol }).count == 3 { // Three of the same symbol in a line
                        
                            totalPayout +=  Int(payoutTable[symbol-1][0] * bet)
                            
                            print("Победитель по normal VShape x3: \(symbol)!")
                        }
                    
                    if vShape.filter({ $0 == symbol }).count == 4 {
                        print("Победитель по normal VShape x4: \(symbol)!")
                        totalPayout +=  Int(payoutTable[symbol-1][1] * bet)
                    }
                    
                    if vShape.filter({ $0 == symbol }).count == 5 || vShape.filter({ $0 == symbol }).count == 6 {
                        print("Победитель по normal VShape x5: \(symbol)!")
                        totalPayout +=  Int(payoutTable[symbol-1][2] * bet)
                    }
                    
                    if vShape.filter({ $0 == symbol }).count >= 3 {
                        luckyVShapes[0] = true
                    }
        }
        
        
        var vShape2: [Int] = []
        for i in 0..<5 {
            for j in 0..<3 {
                if i<=2 && i + j == 2 {
                    vShape2.append(currentMatrix[i][j])
                }
                if i > 2 && abs(i-j) == 2 {
                    vShape2.append(currentMatrix[i][j])
                }
            }
        }
        for symbol in Set(vShape2) {
            if vShape2.filter({ $0 == symbol }).count == 3 { // Three of the
                print("Победитель по new VShape x3: \(symbol)!")
                totalPayout +=  Int(payoutTable[symbol-1][0] * bet)
            }
            
            if vShape2.filter({ $0 == symbol }).count == 4 {
                print("Победитель по new VShape x4: \(symbol)!")
                totalPayout +=  Int(payoutTable[symbol-1][1] * bet)
            }
            
            if vShape2.filter({ $0 == symbol }).count == 5 || vShape2.filter({ $0 == symbol }).count == 6 {
                print("Победитель по newormal VShape x5: \(symbol)!")
                totalPayout +=  Int(payoutTable[symbol-1][2] * bet)
            }
            
            if vShape2.filter({ $0 == symbol }).count >= 3 {
                luckyVShapes[1] = true
            }
}
        
        print("Total payout: \(totalPayout)")
        
        if totalPayout > 0 && isSound {
            playSound(key: "win", player: &player2)
        }
        
        if totalPayout >= 500 && totalPayout < 1000 && !allItems[element-1][0] {
            allItems[element-1][0] = true
            winItem = 1
            showWinItem = true
        } else if totalPayout >= 1000 && totalPayout < 1500 && !allItems[element-1][1]{
            allItems[element-1][1] = true
            winItem = 2
            showWinItem = true
        } else if totalPayout >= 1500 && totalPayout < 2000 && !allItems[element-1][2]{
            allItems[element-1][2] = true
            winItem = 3
            showWinItem = true
        }  else if totalPayout >= 2000 && totalPayout < 2500 && !allItems[element-1][3] {
            allItems[element-1][3] = true
            winItem = 4
            showWinItem = true
        } else if totalPayout >= 2500 && totalPayout < 3000 && !allItems[element-1][4] {
            allItems[element-1][4] = true
            winItem = 5
            showWinItem = true
        } else if totalPayout >= 3000 && totalPayout < 4000 && !allItems[element-1][5] {
            allItems[element-1][5] = true
            winItem = 6
            showWinItem = true
        } else if totalPayout >= 4000 && totalPayout < 5000 && !allItems[element-1][6] {
            allItems[element-1][6] = true
            winItem = 7
            showWinItem = true
        } else if totalPayout >= 5000 && !allItems[element-1][7] {
            allItems[element-1][7] = true
            winItem = 8
            showWinItem = true
        }
         
            balance += totalPayout
        return totalPayout
    }
}
