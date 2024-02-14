//
//  GameView.swift
//

import SwiftUI

struct GameView: View {
    @State var newPosition: CGFloat = 0
    @State var slotSize: CGSize = .zero
    var body: some View {
        ZStack {
            Image("gamebg1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(1.005)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        withAnimation(.spring(response: 2, dampingFraction: 0.85)) {
                            newPosition = CGFloat(90 * Int.random(in: 20...30))
                        }
                    } label: {
                        Image("greenbtnbg")
                            .resizableToFit()
                            .frame(height: 58)
                            .overlay {
                                Text("SPIN")
                                    .foregroundStyle(.white)
                                    .font(.custom(.black, size: 27))
                                    .offset(y: -6)
                                    .shadow(color: Color("txtgreenshadow"), radius: 1, y: 2)
                                    .shadow(color: .black.opacity(0.25), radius: 1)
                            }
                    }
                }
            }
            
            Image("bgslot1")
                .resizableToFit()
                .background {
                    GeometryReader { geo in
                        Color.clear.onAppear {
                            slotSize = geo.size
                                print(slotSize)
                        }
                    }
                }
                .overlay {
                    HStack {
                        ScrollView(showsIndicators: false) {
                                    VStack(spacing: 0) {
                                        ForEach(1..<212) { i in
                                            Image("earthslot\(i % 10 + 1)")
                                                .resizableToFit()
                                                .frame(width: 70, height: 90)
                                                
                                                }
                                        }
                                     .offset(y: -35)
                                     .offset(y: -9000)
                                     .offset(y: newPosition)
                                    
                            }
                        ScrollView(showsIndicators: false) {
                                    VStack(spacing: 0) {
                                        ForEach(1..<212) { i in
                                            Image("earthslot\(i % 10 + 1)")
                                                .resizableToFit()
                                                .frame(width: 70, height: 90)
                                                
                                                }
                                        }
                                     .offset(y: -35)
                                     .offset(y: -9000)
                                     .offset(y: newPosition)
                                    
                            }
                        ScrollView(showsIndicators: false) {
                                    VStack(spacing: 0) {
                                        ForEach(1..<212) { i in
                                            Image("earthslot\(i % 10 + 1)")
                                                .resizableToFit()
                                                .frame(width: 70, height: 90)
                                                
                                                }
                                        }
                                     .offset(y: -35)
                                     .offset(y: -9000)
                                     .offset(y: newPosition)
                                    
                            }
                        ScrollView(showsIndicators: false) {
                                    VStack(spacing: 0) {
                                        ForEach(1..<212) { i in
                                            Image("earthslot\(i % 10 + 1)")
                                                .resizableToFit()
                                                .frame(width: 70, height: 90)
                                                
                                                }
                                        }
                                     .offset(y: -35)
                                     .offset(y: -9000)
                                     .offset(y: newPosition)
                                    
                            }
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 0) {
                                ForEach(1..<212) { i in
                                    Image("earthslot\(i % 10 + 1)")
                                        .resizableToFit()
                                        .frame(width: 70, height: 90)
                                    
                                }
                            }
                            .offset(y: -35)
                            .offset(y: -9000)
                            .offset(y: newPosition)
                            
                        }
                    }
                    .mask {
                        Color.white
                            .frame(height: 300)
                    }
                }
            
         
            .mask {
                Image("bgslot1")
                    .resizableToFit()
            }
          
        }
     
    }
}

#Preview {
    GameView()
}
