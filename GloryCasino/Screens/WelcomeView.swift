//
//  WelcomeView.swift
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var vm: GameLogic
    
    var body: some View {
        ZStack {
                Image("welcomebg\(vm.element)")
                    .resizable()
                    .scaledToFill()
                    .scaleEffect(1.005)
                
                BackStartStack()
                    .environmentObject(vm)
                    .padding(.bottom, 24)
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
