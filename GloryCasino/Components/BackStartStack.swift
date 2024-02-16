//
//  BackStartStack.swift
//

import SwiftUI

struct BackStartStack: View {
    @EnvironmentObject var vm: GameLogic
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Image("welcometxtbg\(vm.element)")
                .resizableToFit()
                .overlay {
                 
                    Text(welcomeTxt[vm.element - 1])
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                            .foregroundStyle(
                                vm.element == 1 ? Pallete.brownEarth :
                                    vm.element == 4 ? Pallete.brownAir : .white)

                            .font(.custom(.semiBold, size: vm.element == 2 ? 20 : vm.element == 3 ? 19 : 18))
                
                
                }
            
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image("bluebtnbg")
                        .resizableToFit()
                        .frame(height: 50)
                        .overlay {
                            Text("BACK")
                                .foregroundStyle(.white)
                                .font(.custom(.black, size: 21))
                                .offset(y: -6)
                                .shadow(color: Color("txtblueshadow"), radius: 1, y: 2)
                                .shadow(color: .black.opacity(0.25), radius: 1)
                        }
                }
            
                Button {
                    
                } label: {
                    Image("greenbtnbg")
                        .resizableToFit()
                        .frame(height: 55)
                        .overlay {
                            Text("START")
                                .foregroundStyle(.white)
                                .font(.custom(.black, size: 31))
                                .offset(y: -6)
                                .shadow(color: Color("txtgreenshadow"), radius: 1, y: 2)
                                .shadow(color: .black.opacity(0.25), radius: 1)
                        }
                }
            }
            .padding(.top, 24)
        }
        .offset(y: 16)
    }
}

#Preview {
    BackStartStack()
        .environmentObject(GameLogic())
}
