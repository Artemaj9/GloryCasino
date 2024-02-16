//
//  ChestView.swift
//

import SwiftUI

struct ChestView: View {
    @EnvironmentObject var vm: GameLogic
    var body: some View {
        ZStack {
                Image("chestbg\(vm.currentChest)")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .scaleEffect(1.005)
                Image("logo\(vm.currentChest)")
                    .resizableToFit()
                    .frame(width: vm.size.width * 0.9)
                    .offset(y: -vm.size.height * 0.35)
                ZStack {
                    Image("chest\(vm.currentChest)")
                        .resizableToFit()
                        .opacity(vm.openChests[vm.currentChest - 1] ? 0 : 1)
                      
                    Image("ochest\(vm.currentChest)")
                        .resizableToFit()
                        .opacity(vm.openChests[vm.currentChest - 1] ? 1 : 0)
                }
                .frame(width: vm.size.width * 0.75)
                .offset(y: -vm.size.height * 0.05)
                VStack {
                    Image("chestplank\(vm.currentChest)")
                        .resizableToFit()
                        .overlay {
                            Group {
                                Text("\(vm.openCount[vm.currentChest - 1])")
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
            
            VStack {
                Button {
                    
                } label: {
                    Image("greenbtnbg")
                        .resizableToFit()
                        .frame(height: 70)
                        .overlay {
                            Text("OPEN")
                                .foregroundStyle(.white)
                                .font(.custom(.black, size: 31))
                                .offset(y: -6)
                                .shadow(color: Color("txtgreenshadow"), radius: 1, y: 2)
                                .shadow(color: .black.opacity(0.25), radius: 1)
                        }
                        .opacity(vm.openChests[vm.currentChest - 1] ? 1 : 0.6)
                        .disabled(!vm.openChests[vm.currentChest - 1])
                }
                Button {
                } label: {
                    Image("bluebtnbg")
                        .resizableToFit()
                        .frame(height: 65)
                        .overlay {
                            Text("TO MENU")
                                .foregroundStyle(.white)
                                .font(.custom(.black, size: 21))
                                .offset(y: -6)
                                .shadow(color: Color("txtblueshadow"), radius: 1, y: 2)
                                .shadow(color: .black.opacity(0.25), radius: 1)
                        }
                }
            }
            .offset(y: vm.size.height * 0.38)
     
       
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ChestView()
        .environmentObject(GameLogic())
}
