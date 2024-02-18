//
//  WelcomeView.swift
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var vm: GameLogic
    
    var body: some View {
        ZStack {
            if !vm.isGame {
                Image("welcomebg\(vm.element)")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.005)
                
                BackStartStack()
                    .environmentObject(vm)
                    .padding(.bottom, 24)
            } else {
                GameView()
                    .environmentObject(vm)
                    .transition(.blur)
            }
        }
        .ignoresSafeArea()
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
    }
    
}

#Preview {
    WelcomeView()
        .environmentObject(GameLogic())
}
