//
//  FireWin.swift
//  GloryCasino
//
//  Created by Artem on 16.02.2024.
//

import SwiftUI

struct FireWin: View {
    @EnvironmentObject var vm: GameLogic
    @State var opacity: Double = 1
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
            RaysDust()
                .environmentObject(vm)
            Image("firewinbg")
                .resizableToFit()
                .overlay {
                    VStack {
                        ZStack {
                            Image("fwitem\(vm.winItem)")
                                .resizableToFit()
                                .opacity(opacity)
                            Image("fwopen\(vm.winItem)")
                                .resizableToFit()
                                .scaleEffect(fwGeo[vm.winItem - 1].scale)
                                .opacity(1 - opacity)
                                .rotationEffect(Angle(degrees: fwGeo[vm.winItem - 1].degrees))

                        }
                            .frame(height: vm.size.height*0.25)
                        Group {
                            Text("YOU BET LIMIT HAS BEEN\n INCREASED TO ")
                            
                                .font(.custom(.black, size: 18))
                            +
                            Text("\(vm.itemToSumm(vm.winItem))")
                            
                                .font(.custom(.black, size: 24))
                        }
                        .multilineTextAlignment(.center)
                        .foregroundColor (.white)
                        .offset(y: -8)
                    }
                }
            Button {
                withAnimation {
                    vm.showWinItem = false
                    if vm.allItems[vm.element-1].filter{$0}.count == 8 {
                        vm.showkey[1] = true
                    }
                }
            } label: {
                Image("getbtn")
                    .resizableToFit()
                    .frame(height: 65)
            }
            .offset(y: vm.size.height * 0.35)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 3)) {
                opacity = 0
            }
        }
    }
}


#Preview {
    FireWin()
        .environmentObject(GameLogic())
}
