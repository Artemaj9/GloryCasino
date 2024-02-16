//
//  ItemsPosition.swift
//  GloryCasino
//
//  Created by Artem on 15.02.2024.
//

import Foundation

struct ItemGeometry {
    let width: CGFloat
    let xCoef: CGFloat
    let yCoef: CGFloat
}

let wGeo = [
    ItemGeometry(width: 0.25, xCoef: 0, yCoef: -0.12),
    ItemGeometry(width: 0.25, xCoef: 0.25, yCoef: -0.09),
    ItemGeometry(width: 0.25, xCoef: -0.25, yCoef: -0.1),
    ItemGeometry(width: 0.23, xCoef: -0.25, yCoef: 0.01),
    ItemGeometry(width: 0.25, xCoef: 0.25, yCoef: 0.01),
    ItemGeometry(width: 0.29, xCoef: -0.17, yCoef: 0.12),
    ItemGeometry(width: 0.266, xCoef: 0.17, yCoef: 0.12),
    ItemGeometry(width: 0.26, xCoef: 0, yCoef: 0)
]

let aGeo = [
    ItemGeometry(width: 0.16, xCoef: -0.32, yCoef: -0.2),
    ItemGeometry(width: 0.16, xCoef: 0.32, yCoef: -0.2),
    ItemGeometry(width: 0.16, xCoef: 0, yCoef: -0.12),
    ItemGeometry(width: 0.16, xCoef: 0.32, yCoef: 0),
    ItemGeometry(width: 0.16, xCoef: -0.32, yCoef: 0),
    ItemGeometry(width: 0.16, xCoef: -0.32, yCoef: 0.2),
    ItemGeometry(width: 0.16, xCoef: 0, yCoef: 0.09),
    ItemGeometry(width: 0.16, xCoef: 0.32, yCoef: 0.2),
]


