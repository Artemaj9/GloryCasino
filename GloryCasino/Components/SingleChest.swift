//
//  SingleChest.swift
//

import SwiftUI

struct SingleChest: View {
    @EnvironmentObject var vm: GameLogic
    let chest: Int
    var body: some View {
        ZStack {
            Image("chestbg\(chest)")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(1.005)
            
            Image("logo\(chest)")
                .resizableToFit()
                .frame(width: vm.size.width * 0.9)
                .offset(y: -vm.size.height * 0.35)
            
            ZStack {
                Image("chest\(chest)")
                    .resizableToFit()
                    .opacity(vm.openChests[chest - 1] ? 0 : 1)
                
                Image("ochest\(chest)")
                    .resizableToFit()
                    .opacity(vm.openChests[vm.currentChest - 1] ? 1 : 0)
            }
            .frame(width: vm.size.width * 0.75)
            .offset(y: -vm.size.height * 0.05)
            
            VStack {
                Image("chestplank\(chest)")
                    .resizableToFit()
                    .overlay {
                        Group {
                            Text("\(vm.openCount[chest - 1])")
                                .font(.custom(.black, size: 39))
                            +
                            Text("/8")
                                .font(.custom(.black, size: 27))
                        }
                        .foregroundStyle(.white)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.25), radius: 2, y: 2)
                    }
                Text("Swipe to change the game")
                    .foregroundStyle(.white)
                    .font(.custom(.bold, size: 25))
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.52), radius: 4, y: 4)
                    .padding()
            }
            .offset(y: vm.size.height * 0.2)
            }
        .ignoresSafeArea()
        }
}

#Preview {
    SingleChest(chest: 3)
        .environmentObject(GameLogic())
}
