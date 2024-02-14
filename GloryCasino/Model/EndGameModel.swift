//
//  EndGameModel.swift
//

import Foundation

struct EndGame {
    let lightCoef: CGFloat
    let titleCoef: CGFloat
    let sizeCoef: CGFloat
}

let endData = [
    EndGame(lightCoef: 0.14, titleCoef: 0, sizeCoef: 0.8),
    EndGame(lightCoef: 0.23, titleCoef: 0.02, sizeCoef: 0.9),
    EndGame(lightCoef: 0.2, titleCoef: 0.04, sizeCoef: 0.8),
    EndGame(lightCoef: 0.2, titleCoef: 0.02, sizeCoef: 0.87),
]
