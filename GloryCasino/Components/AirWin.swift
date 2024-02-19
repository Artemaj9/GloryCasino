//
//  AirWin.swift
//

import SwiftUI

struct AirWin: View {
    @EnvironmentObject var vm: GameLogic
    @State var opacity: Double = 1
 
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
            RaysDust()
                .environmentObject(vm)
            Image("airwinbg")
                .resizableToFit()
                .padding()
                .overlay {
                    VStack {
                        ZStack {
                            Image("aitem\(vm.winItem)")
                                .resizableToFit()
                                .opacity(opacity)
                            Image("aopen\(vm.winItem)")
                                .resizableToFit()
                                .opacity(1 - opacity)
                            
                        }
                        .frame(height: vm.size.height*0.2)
                        
                    }
                }
                .background(alignment: .bottom) {
                    Image("airpaper")
                        .resizableToFit()
                        .frame(width: vm.size.width * 0.94)
                    
                        .overlay {
                            Group {
                                Text("YOU BET LIMIT HAS BEEN\n INCREASED TO ")
                                
                                    .font(.custom(.black, size: 18))
                                +
                                Text("\(vm.itemToSumm(vm.winItem))")
                                
                                    .font(.custom(.black, size: 24))
                            }
                            .multilineTextAlignment(.center)
                            .foregroundColor (Color("airwintxt"))
                            .padding(.bottom, 4)
                            .offset(y: vm.size.height * 0.02)
                        }
                        .offset(y: vm.size.height*0.08)
                }
                .offset(y: -vm.size.height*0.03)
            Button {
                withAnimation {
                    vm.showWinItem = false
                    if vm.allItems[vm.element-1].filter{$0}.count == 8 {
                        vm.showkey[3] = true
                    }
                }
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
    AirWin()
        .environmentObject(GameLogic())
}
