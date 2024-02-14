//
//  LuminanceToAlpha.swift
//  GloryCasino
//
//  Created by Artem on 14.02.2024.
//

import SwiftUI

struct Palette: View {
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<10) { index in
                Color(white: Double(index) / Double(9))
                    .frame(width: 20, height: 40)
            }
        }
    }
}


struct LuminanceToAlphaExample: View {
    var body: some View {
        VStack(spacing: 20) {
//            Palette()
//
//
//            Palette()
//                .luminanceToAlpha()
            Color.yellow
                .mask {
                    Image("light")
                        .resizableToFit()
                        .luminanceToAlpha()
                        .rotationEffect(.degrees(90))
                }
        }
        .padding()
      //  .background(.blue)
    }
}
#Preview {
    LuminanceToAlphaExample()
}
