//
//  MenuView.swift
//

import SwiftUI

struct MenuView: View {
    @State var size: CGSize = .zero
    var body: some View {
        NavigationView {
            ZStack {
                Image("menubg1")
                    .resizable()
                    .scaledToFill()
                    .overlay {
                        GeometryReader { geo in
                            Color.clear
                                .onAppear {
                                    size = geo.size
                                    print("\(size.width)")
                                    print("\(size.height)")
                                }
                        }
                    }
                
                VStack(spacing: 0) {
                    HStack {
                        NavigationLink {
                            InfoView()
                        } label: {
                            Image("infobtn")
                                .resizableToFit()
                                .frame(height: 45)
                        }

                     
                        Image("balancebar")
                            .resizableToFit()
                            .frame(height: 60)
                            .overlay {
                                Text("5000")
                                    .foregroundStyle(.white)
                                    .font(.custom(.black, size: 24))
                            }
                        Image("cup")
                            .resizableToFit()
                            .frame(height: 45)
                    }
                    Image("logo1")
                        .resizableToFit()
                        .frame(width: size.width * 0.4)
                    HStack {
                        Spacer()
                        Image("winchance1")
                            .resizableToFit()
                            .frame(height: 70)
                    }
                    HStack {
                        Spacer()
                        Image("label1")
                            .resizableToFit()
                            .frame(height: 40)
                    }
                    HStack {
                        Spacer()
                        Image("text1")
                            .resizableToFit()
                            .frame(height: 15)
                    }
                    
                    //  Spacer()
                    Button {
                    } label: {
                        Image("greenbtnbg")
                            .resizableToFit()
                            .frame(height: 55)
                            .overlay {
                                Text("PLAY")
                                    .foregroundStyle(.white)
                                    .font(.custom(.black, size: 32))
                                    .offset(y: -6)
                                    .shadow(color: Color("txtgreenshadow"), radius: 1, y: 2)
                                    .shadow(color: .black.opacity(0.25), radius: 1)
                            }
                    }
                    Image("earthbtn")
                        .resizableToFit()
                        .padding(.horizontal, 24)
                    Image("firebtn")
                        .resizableToFit()
                        .padding(.horizontal, 24)
                    Image("waterbtn")
                        .resizableToFit()
                        .padding(.horizontal, 24)
                    Image("airbtn")
                        .resizableToFit()
                        .padding(.horizontal, 24)
                }
                .padding(.bottom, 24)
            }
            .ignoresSafeArea()
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    MenuView()
}
