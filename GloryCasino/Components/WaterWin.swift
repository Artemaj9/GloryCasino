//
//  WaterWin.swift
//

import SwiftUI

struct WaterWin: View {
    @EnvironmentObject var vm: GameLogic
    @State var opacity: Double = 1
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
            RaysDust()
                .environmentObject(vm)
            Image("chest")
                .resizableToFit()
                .padding()
                .overlay {
                    VStack {
                        ZStack {
                            Image("witem\(vm.waterWinItem)")
                                .resizableToFit()
                                .opacity(opacity)
                            Image("wopen\(vm.waterWinItem)")
                                .resizableToFit()
                                .opacity(1 - opacity)

                        }
                            .frame(height: vm.size.height*0.25)
    
                    }
                }
                .background(alignment: .bottom) {
                    Image("bred")
                        .resizableToFit()
                        .frame(width: vm.size.width * 0.94)
                  
                        .overlay {
                            Group {
                                Text("YOU BET LIMIT HAS BEEN\n INCREASED TO ")
                                
                                    .font(.custom(.black, size: 18))
                                +
                                Text("\(vm.itemToSumm(vm.waterWinItem))")
                                
                                    .font(.custom(.black, size: 24))
                            }
                            .multilineTextAlignment(.center)
                            .foregroundColor (.white)
                            .padding(.bottom, 4)
                            .offset(y: vm.size.height * 0.01)
                        }
                        .offset(y: vm.size.height*0.05)
                 
                }
            Button {
                
            } label: {
                Image("getbtn")
                    .resizableToFit()
                    .frame(height: 65)
            }
            .offset(y: vm.size.height * 0.4)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 3)) {
                opacity = 0
            }
        }
    }
}

#Preview {
    WaterWin()
        .environmentObject(GameLogic())
}
