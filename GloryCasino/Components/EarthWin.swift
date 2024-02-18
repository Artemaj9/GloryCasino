//
//  EarthWin.swift
//

import SwiftUI

struct EarthWin: View {
    @EnvironmentObject var vm: GameLogic
    @State var opacity: Double = 1
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
            RaysDust()
                .environmentObject(vm)
            Image("welcometxtbg1")
                .resizableToFit()
                .overlay(alignment: .top) {
                    Image("congratulations")
                        .resizableToFit()
                        .padding()
                        .offset(y: vm.size.height*0.02)
                }
                .overlay {
                    VStack {
                        ZStack {
                            Image("eitem\(vm.earthWinItem)")
                                .resizableToFit()
                                .opacity(opacity)
                            Image("eopen\(vm.earthWinItem)")
                                .resizableToFit()
                                .scaleEffect(1.1)
                                .opacity(1 - opacity)
                        }
                            .frame(height: vm.size.height*0.25)
                            .padding(.top)
                            .offset(y: 8)
                        Group {
                            Text("YOU BET LIMIT HAS BEEN\n INCREASED TO ")
                            
                                .font(.custom(.black, size: 18))
                            +
                            Text("\(vm.itemToSumm(vm.earthWinItem))")
                            
                                .font(.custom(.black, size: 24))
                        }
                        .multilineTextAlignment(.center)
                        .foregroundColor (Color("earthwintxt"))
                    }
                    .offset(y: 16)
                }
            Button {
                withAnimation {
                    vm.showWinItem = false
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
    EarthWin()
        .environmentObject(GameLogic())
}
