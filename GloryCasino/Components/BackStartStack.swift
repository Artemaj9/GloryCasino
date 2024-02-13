//
//  BackStartStack.swift
//

import SwiftUI

struct BackStartStack: View {
    
    @Binding var screen: Int
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Image("welcometxtbg\(screen)")
                .resizableToFit()
                .overlay {
                 
                        Text(welcomeTxt[screen - 1])
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                            .foregroundStyle(
                                screen == 1 ? Pallete.brownEarth :
                                    screen == 4 ? Pallete.brownAir : .white)

                            .font(.custom(.semiBold, size: screen == 2 ? 20 : screen == 3 ? 19 : 18))
                
                
                }
            
            HStack {
                Button {
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
    BackStartStack(screen: .constant(4))
}
