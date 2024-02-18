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
            
            VStack {
                Button {
                    withAnimation {
                        vm.openChests[vm.currentChest - 1] = true
                    }
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
                      //  .opacity(vm.openChests[vm.currentChest - 1] ? 1 : 0.6)
                     //   .disabled(!vm.openChests[vm.currentChest - 1])
                        .disabled(vm.allItems[vm.currentChest-1].filter{$0}.count != 8)
                        .opacity(vm.allItems[vm.currentChest-1].filter{$0}.count == 8 ? 1 : 0.6)
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
