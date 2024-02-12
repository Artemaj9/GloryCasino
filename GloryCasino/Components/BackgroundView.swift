//
//  BackgroundView.swift
//

import SwiftUI

struct BackgroundView: View {
    @State var radius: CGFloat = 10
    @State var opacity: Double = 0
    
    var body: some View {
        ZStack {
            mainBg
            
            RadialGradient(gradient: Gradient(colors: [Color("pinkradial").opacity(opacity),Color("pinkradial").opacity(0)]), center: .bottomTrailing, startRadius: 10, endRadius: radius)
                .offset(y: 50)
                .animation(.easeIn(duration: 1), value: radius)
                .animation(.easeIn(duration: 1.5), value: opacity)
            
            RadialGradient(gradient: Gradient(colors: [Color("blueradial").opacity(opacity), Color("blueradial").opacity(0)]), center: .topLeading, startRadius: 10, endRadius: radius)
                .offset(y: 0)
                .animation(.easeIn(duration: 1), value: radius)
                .animation(.easeIn(duration: 1.5), value: opacity)
        }
        .ignoresSafeArea()
        .onAppear {
            radius = 450
            opacity = 1
        }
    }
}

#Preview {
    BackgroundView()
}
