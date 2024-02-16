//
//  FireWinGeometry.swift
//  GloryCasino
//
//  Created by Artem on 16.02.2024.
//

import Foundation


struct FireWinGeometry {
    let scale: CGFloat
    let degrees: Double
}

let fwGeo = [
    FireWinGeometry(scale: 0.95, degrees: 0),
    FireWinGeometry(scale: 1, degrees: -45),
    FireWinGeometry(scale: 1.3, degrees: 45),
    FireWinGeometry(scale: 1.3, degrees: 0),
    FireWinGeometry(scale: 1.3, degrees: 0),
    FireWinGeometry(scale: 1.2, degrees: 60),
    FireWinGeometry(scale: 1.1, degrees: -60),
    FireWinGeometry(scale: 1.3, degrees: 90),
]
// scale,degrees [(0.95;0), (1; -45), (1.3; 45), (1.3; 0), (1.3; 0), (1.2;60), (1.1; -60),(1.3; 90)
                            //]
