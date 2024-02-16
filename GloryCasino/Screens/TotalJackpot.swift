//
//  TotalJackpot.swift
//

import SwiftUI

struct TotalJackpot: View {
    @EnvironmentObject var vm: GameLogic
    let plankoffsets: [CGFloat] = [0.0, 0.0, 0.09, 0.0]
    var body: some View {
        ZStack {
            Image("chestbg\(vm.currentChest)")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(1.005)
            
            
            Image("ochest\(vm.currentChest)")
                .resizableToFit()
                .scaleEffect(1.6)
                .offset(x: -vm.size.width*0.05, y: -vm.size.height * 0)
            ZStack {
                Image("tjplankbg\(vm.currentChest)")
                    .resizableToFit()
                    .overlay {
                        TJText(number: vm.currentChest, jackpot: 999995)
                    }
                    .offset(y: vm.size.height * tjGeo[vm.currentChest-1].plankOffset)
                
                Image("tjtitle\(vm.currentChest)")
                    .resizableToFit()
                 
                    .scaleEffect(tjGeo[vm.currentChest-1].titleScale)
                    .offset(y: tjGeo[vm.currentChest-1].titleOffset)
                    .padding(.top)
            }
            
                .offset(y: -vm.size.height * 0.38)
             
            Button {
                
            } label: {
                Image("chestgetbtn")
                    .resizableToFit()
                    .frame(height: 80)
            }
            .offset(y: vm.size.height*0.4)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    TotalJackpot()
        .environmentObject(GameLogic())
}
