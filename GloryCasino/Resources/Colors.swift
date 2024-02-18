//
//  Colors.swift
//

import SwiftUI
let mainBg = LinearGradient(
colors: [
    Color("violetbg"),
    Color("bluebg"),
    Color("lightbluebg"),
],
startPoint: .bottomTrailing,
endPoint: .topLeading
)

enum Pallete {
    static let brownEarth = Color("brownearthtxt")
    static let brownAir = Color("brownairtxt")
}


let yellowGrad = LinearGradient(
colors: [
    Color("lightyellowgrad"),
    Color("brightyellowgrad"),
    Color("brightyellowgrad")
],
startPoint: .top,
endPoint: .bottom
)


