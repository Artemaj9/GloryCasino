//
//  InfoView.swift
//

import SwiftUI

struct InfoView: View {
    @State private var screen = 1
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 0) {
                Spacer()
                
                HStack {
                    Button {
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
                        if screen < 3 {
                            screen += 1
                        }
                    } label: {
                        Image("greenbtnbg")
                            .resizableToFit()
                            .frame(height: 55)
                            .overlay {
                                Text(screen != 3 ? "Next" : "TO MENU")
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
                        Text(Infotxt.description1)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 20)
                            .font(.custom(.semiBold, size: 16))
                    }
                
                Text(Infotxt.footnote)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .font(.custom(.semiBold, size: 16))
                Spacer()
            }
        }
    }
}

#Preview {
    InfoView()
}
