//
//  TotalJackpot.swift
//

import SwiftUI

struct TotalJackpot: View {
    @EnvironmentObject var vm: GameLogic
    @Environment(\.dismiss) var dismiss
    @State var radius: Double = 10
    @State var opacity: Double = 0
    @State var rotation: Double = 0
    @State var offsetY: CGFloat = 0
    
    let plankoffsets: [CGFloat] = [0.0, 0.0, 0.09, 0.0]
    var body: some View {
        ZStack {
            Image("chestbg\(vm.currentChest)")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(1.005)
            
                RadialGradient(gradient: Gradient(colors: [Color.white ,Color("light")]), center: .center, startRadius: 1, endRadius: radius)
                    .opacity(opacity)
                
                    .mask {
                        Image("light")
                            .resizableToFit()
                            .luminanceToAlpha()
                            .rotationEffect(.degrees(rotation))
                        
                    }
                    .offset(y: -vm.size.height*0.3)
            
                    .animation(.easeInOut(duration: 3), value: radius)
                    .animation(.easeInOut(duration: 2), value: opacity)
                    .animation(.smooth(duration: 2), value: rotation)
            
            
            RadialGradient(gradient: Gradient(colors: [Color.white ,Color("light")]), center: .center, startRadius: 1, endRadius: radius)
                .opacity(opacity)
                .blur(radius: 10)
            
                .mask {
                    Image("light")
                        .resizableToFit()
                        .luminanceToAlpha()
                        .rotationEffect(.degrees(rotation))
                        .scaleEffect(2.6)
                }
                .blur(radius: 20)
                .opacity(0.5)

        
                .animation(.easeInOut(duration: 3), value: 5*radius)
                .animation(.easeInOut(duration: 2), value: opacity)
                .animation(.smooth(duration: 2), value: rotation)
            
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
                vm.balance += vm.jackpots[vm.currentChest - 1]
                vm.jackpots[vm.currentChest - 1] = 0
                vm.allItems[vm.currentChest - 1] = Array(repeating: false, count: 8)
                withAnimation {
                    vm.showTotalJackpot[vm.currentChest - 1] = false
                }
               dismiss()
                
            } label: {
                Image("chestgetbtn")
                    .resizableToFit()
                    .frame(height: 80)
            }
            .offset(y: vm.size.height*0.4)
        }
        .ignoresSafeArea()
        .onAppear {
            radius = 70
            opacity = 1
            rotation = 10
        }
    }
}

#Preview {
    TotalJackpot()
        .environmentObject(GameLogic())
}
