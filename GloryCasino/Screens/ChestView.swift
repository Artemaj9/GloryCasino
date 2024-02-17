//
//  ChestView.swift
//

import SwiftUI

struct ChestView: View {
    @EnvironmentObject var vm: GameLogic
    @Environment(\.dismiss) var dismiss
    @State var leftFlag = false
    
    
    var body: some View {
        ZStack {
            switch vm.currentChest {
            case 1: SingleChest(chest: 1)
                    .environmentObject(vm)
                    .transition(.asymmetric(insertion: .move(edge: leftFlag ? .leading : .trailing), removal:  .move(edge: !leftFlag ? .leading : .trailing)))
            case 2: SingleChest(chest: 2)
                    .environmentObject(vm)
                    .transition(.asymmetric(insertion: .move(edge: leftFlag ? .leading : .trailing), removal:  .move(edge: !leftFlag ? .leading : .trailing)))
            case 3: SingleChest(chest: 3)
                    .environmentObject(vm)
                    .transition(.asymmetric(insertion: .move(edge: leftFlag ? .leading : .trailing), removal:  .move(edge: !leftFlag ? .leading : .trailing)))
            case 4: SingleChest(chest: 4)
                    .environmentObject(vm)
                    .transition(.asymmetric(insertion: .move(edge: leftFlag ? .leading : .trailing), removal:  .move(edge: !leftFlag ? .leading : .trailing)))
            default : EmptyView()
            }
//                Image("chestbg\(vm.currentChest)")
//                    .resizable()
//                    .scaledToFill()
//                    .ignoresSafeArea()
//                    .scaleEffect(1.005)
//            
//                Image("logo\(vm.currentChest)")
//                    .resizableToFit()
//                    .frame(width: vm.size.width * 0.9)
//                    .offset(y: -vm.size.height * 0.35)
//            
//                ZStack {
//                    Image("chest\(vm.currentChest)")
//                        .resizableToFit()
//                        .opacity(vm.openChests[vm.currentChest - 1] ? 0 : 1)
//                      
//                    Image("ochest\(vm.currentChest)")
//                        .resizableToFit()
//                        .opacity(vm.openChests[vm.currentChest - 1] ? 1 : 0)
//                }
//                .frame(width: vm.size.width * 0.75)
//                .offset(y: -vm.size.height * 0.05)
//            
//                VStack {
//                    Image("chestplank\(vm.currentChest)")
//                        .resizableToFit()
//                        .overlay {
//                            Group {
//                                Text("\(vm.openCount[vm.currentChest - 1])")
//                                    .font(.custom(.black, size: 39))
//                                +
//                                Text("/8")
//                                    .font(.custom(.black, size: 27))
//                            }
//                            .foregroundStyle(.white)
//                            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.25), radius: 2, y: 2)
//                        }
//                    
//                    Text("Swipe to change the game")
//                        .foregroundStyle(.white)
//                        .font(.custom(.bold, size: 25))
//                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.52), radius: 4, y: 4)
//                        .padding()
//                }
//                .offset(y: vm.size.height * 0.2)
            
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
                    dismiss()
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
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
        .gesture(
            DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
            .onEnded { value in
                switch(value.translation.width, value.translation.height) {
                case (...0, -30...30):  
                    leftFlag = false
                    if vm.currentChest == 4 {
                        withAnimation {
                            vm.currentChest = 1
                        }
                    } else {
                        withAnimation {
                            vm.currentChest += 1
                        }
                    }
 
                    case (0..., -30...30):
                    leftFlag = true
                    if vm.currentChest == 1 {
                        withAnimation {
                            vm.currentChest = 4
                        }
                    } else {
                        withAnimation {
                            vm.currentChest -= 1
                        }
                    }
                    case (-100...100, ...0):  print("up swipe")
                    case (-100...100, 0...):  print("down swipe")
                    default:  print("no clue")
                }
            }
        )
    }
}

#Preview {
    ChestView()
        .environmentObject(GameLogic())
}
