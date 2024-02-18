//
//  WaterQuest.swift
//

import SwiftUI

struct WaterQuest: View {
    @EnvironmentObject var vm: GameLogic
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        ZStack {
            Group {
                Image("endbg3")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .scaleEffect(1.005)
                
                Image("logo3")
                    .resizableToFit()
                    .frame(width: vm.size.width * 0.8)
                    .offset(y: -vm.size.height * 0.38)
            }
            
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
            
            Button {
                dismiss()
            } label: {
                Image("getbtn")
                    .resizableToFit()
                    .frame(width: vm.size.width * 0.4)
                    .offset(y: vm.size.height*0.4)
            }
        }
        .onAppear {

        }
    }
}

#Preview {
    WaterQuest()
        .environmentObject(GameLogic())
}
