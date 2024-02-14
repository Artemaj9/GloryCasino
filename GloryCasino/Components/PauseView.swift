//
//  PauseView.swift
//

import SwiftUI

struct PauseView: View {
    @EnvironmentObject var vm: GameLogic
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3).ignoresSafeArea()
            
            Image("pause")
                .resizableToFit()
                .padding(.horizontal, 8)
                .overlay(alignment: .bottom) {
                    VStack {
                        Button {
                            vm.isPaused = false
                        } label: {
                            Image("greenbtnbg")
                                .resizableToFit()
                                .frame(height: 60)
                                .scaleEffect(x: 1.2)
                                .overlay {
                                    Text("BACK")
                                        .foregroundStyle(.white)
                                        .font(.custom(.black, size: 31))
                                        .offset(y: -6)
                                        .shadow(color: Color("txtgreenshadow"), radius: 1, y: 2)
                                        .shadow(color: .black.opacity(0.25), radius: 1)
                                }
                        }
                        
                        Button {
                            vm.isSound.toggle()
                        } label: {
                            Image("greenbtnbg")
                                .resizableToFit()
                                .frame(height: 58)
                                .overlay {
                                    Text(vm.isSound ? "SOUND: OFF" : "SOUND: ON")
                                        .foregroundStyle(.white)
                                        .font(.custom(.black, size: 27))
                                        .offset(y: -6)
                                        .shadow(color: Color("txtgreenshadow"), radius: 1, y: 2)
                                        .shadow(color: .black.opacity(0.25), radius: 1)
                                }
                        }
                        
                        Button {
                            vm.isPaused = false
                            dismiss()
                        } label: {
                            Image("bluebtnbg")
                                .resizableToFit()
                                .frame(height: 55)
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
                    .padding(.bottom)
                }
        }
    }
}

#Preview {
    PauseView()
        .environmentObject(GameLogic())
}
