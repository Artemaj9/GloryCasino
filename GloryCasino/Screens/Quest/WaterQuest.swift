//
//  WaterQuest.swift
//

import SwiftUI

struct WaterQuest: View {
    @EnvironmentObject var vm: GameLogic
    
    var body: some View {
        ZStack {
            Image("endbg3")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(1.005)
            
            Image("logo3")
                .resizableToFit()
                .frame(width: vm.size.width * 0.8)
                .offset(y: -vm.size.height * 0.38)
            
            Image("chest")
                .resizableToFit()
                .overlay {
                    ForEach (1..<9) { i in
                        ZStack {
                            Image("witem\(i)")
                                .resizableToFit()
                                .opacity(vm.waterItems[i-1] ? 0 : 1)
                            Image("wopen\(i)")
                                .resizableToFit()
                                .opacity(vm.waterItems[i-1] ? 1 : 0)
                            
                        }
                        .frame(width: vm.size.width * wGeo[i-1].width)
                        .offset(x: vm.size.width * wGeo[i-1].xCoef, y: vm.size.height * wGeo[i-1].yCoef)
                    }
//                
//                    ZStack {
//                        Image("witem1")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[0] ? 0 : 1)
//                        Image("wopen1")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[0] ? 1 : 0)
//                        
//                    }
//                        .frame(width: vm.size.width * 0.25)
//                        .offset(y: -vm.size.height * 0.12)
//                    ZStack {
//                        Image("witem2")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[1] ? 0 : 1)
//                        Image("wopen2")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[1] ? 1 : 0)
//                    }
//                    .frame(width: vm.size.width *  0.25)
//                        .offset(x: vm.size.width * 0.25, y: -vm.size.height * 0.09)
//                    ZStack {
//                        Image("witem3")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[2] ? 0 : 1)
//                        Image("wopen3")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[2] ? 1 : 0)
//                    }
//                        .frame(width: vm.size.width * 0.25)
//                        .offset(x: -vm.size.width * 0.25, y: -vm.size.height * 0.1)
//                    ZStack {
//                        Image("witem4")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[3] ? 0 : 1)
//                        
//                        Image("wopen4")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[3] ? 1 : 0)
//                    }
//                        .frame(width: vm.size.width * 0.23)
//                        .offset(x: -vm.size.width * 0.25, y: vm.size.height * 0.01)
//                    ZStack {
//                        Image("witem5")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[4] ? 0 : 1)
//                        Image("wopen5")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[4] ? 1 : 0)
//                    }
//                        .frame(width: vm.size.width * 0.25)
//                        .offset(x: vm.size.width * 0.25, y: vm.size.height * 0.01)
//                    ZStack {
//                        Image("witem6")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[5] ? 0 : 1)
//                        Image("wopen6")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[5] ? 1 : 0)
//                    }
//                        .frame(width: vm.size.width * 0.29)
//                        .offset(x: -vm.size.width * 0.17, y: vm.size.height * 0.12)
//                    ZStack {
//                        Image("witem7")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[6] ? 0 : 1)
//                        Image("wopen7")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[6] ? 1 : 0)
//                    }
//                        .frame(width: vm.size.width * 0.26)
//                        .offset(x: vm.size.width * 0.17, y: vm.size.height * 0.12)
//                    ZStack {
//                        Image("witem8")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[7] ? 0 : 1)
//                        Image("wopen8")
//                            .resizableToFit()
//                            .opacity(vm.waterItems[7] ? 1 : 0)
//                    }
//                        .frame(width: vm.size.width * 0.26)
                }
                .offset(y: -vm.size.height * 0.06)
              
                    
            Image("watercollected")
                .resizableToFit()
                .frame(width: vm.size.width * 0.8)
                .overlay(alignment: .bottom) {
                    Image("waterlabelbg")
                        .resizableToFit()
                        .frame(width: vm.size.width * 0.5)
                        .offset(y: vm.size.height * 0.05)
                }
                .offset(y: vm.size.height*0.25)
        }
        .onAppear {
            vm.waterItems[0] = true
            vm.waterItems[1] = true
            vm.waterItems[2] = true
            vm.waterItems[3] = true
        }
    }
}

#Preview {
    WaterQuest()
        .environmentObject(GameLogic())
}
