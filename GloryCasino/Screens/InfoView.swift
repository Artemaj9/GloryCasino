//
//  InfoView.swift
//

import SwiftUI

struct InfoView: View {
    @State private var screen = 1
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(spacing: 0) {
                Spacer()
                
                Text(Infotxt.footnote)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .font(.custom(.semiBold, size: 13))
                
                HStack {
                    Button {
                        if screen == 1 {
                            dismiss()
                        }
                        
                        if screen > 1 {
                            screen -= 1
                        }
                     
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
                        if screen == 3 {
                            dismiss()
                        }
                        
                        if screen < 3 {
                                screen += 1
                        }
                        
                    } label: {
                        Image("greenbtnbg")
                            .resizableToFit()
                            .frame(height: 55)
                            .overlay {
                                Text("Next")
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
            
            VStack {
                Image("infologo\(screen)")
                    .resizableToFit()
                    .padding(.horizontal, 8)
                
                Image("infobgrect")
                    .resizableToFit()
                    .padding(.horizontal, 8)
                    .overlay {
                        Text(screen == 1 ? Infotxt.description1 : screen == 2 ? Infotxt.description2 : Infotxt.description3)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 20)
                            .font(.custom(.semiBold, size: 16))
                    }
             
                Spacer()
            }
        }
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
    }
}

#Preview {
    InfoView()
}
