//
//  AnyTransition+ext.swift
//

import SwiftUI

struct BlurTransition: ViewModifier {
    var progress = 0.0
    
    func body(content: Content) -> some View {
        content
            .blur(radius: 10 * progress)
            .opacity(1 - progress)
            .clipped()
    }
}

extension AnyTransition {
    static let blur: AnyTransition = .modifier(
        active: BlurTransition(progress: 1),
        identity: BlurTransition(progress: 0)
    )
}
