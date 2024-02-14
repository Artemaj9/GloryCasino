//
//  PauseView.swift
//

import SwiftUI

struct PauseView: View {
    var body: some View {
        Image("pause")
            .resizableToFit()
            .padding(.horizontal, 8)
            .overlay(alignment: .bottom) {
                VStack {
                    Button {
                        
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
                        
                    } label: {
                        Image("greenbtnbg")
                            .resizableToFit()
                            .frame(height: 58)
                            .overlay {
                                Text("SOUND: ON")
                                    .foregroundStyle(.white)
                                    .font(.custom(.black, size: 27))
                                    .offset(y: -6)
                                    .shadow(color: Color("txtgreenshadow"), radius: 1, y: 2)
                                    .shadow(color: .black.opacity(0.25), radius: 1)
                            }
                    }
                    
                    Button {
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

#Preview {
    PauseView()
}
