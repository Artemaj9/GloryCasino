//
//  WonSpins.swift
//

import SwiftUI

struct WonSpins: View {

    @EnvironmentObject var vm: GameLogic
    
    var body: some View {
        ZStack {
            Image("gamebg\(vm.element)")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Color.black.opacity(0.2)
                .ignoresSafeArea()

            RaysDust()
                .environmentObject(vm)
            
            Image("swonbg\(vm.element)")
                .resizableToFit()
            
            Image("getbtn")
                .resizableToFit()
                .frame(height: 65)
                .offset(y: vm.size.height * 0.35)
            
        }
    }
}

#Preview {
    WonSpins()
        .environmentObject(GameLogic())
}
