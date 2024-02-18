//
//  EndGameView.swift
//

import SwiftUI

struct EndGameView: View {
    @State var radius: Double = 10
    @State var opacity: Double = 0
    @State var rotation: Double = 0
    @State var offsetY: CGFloat = 0
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var vm: GameLogic
    
    var body: some View {
        ZStack {
            Image("endbg\(vm.element)")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(1.005)
            
            VStack {
                Image("logo\(vm.element)")
                    .resizableToFit()
                    .padding(.top, 24)
                    .frame(width: vm.size.width * endData[vm.element-1].sizeCoef)
                    .offset(y: vm.size.height*endData[vm.element-1].titleCoef)
                Spacer()
            }
            
            ZStack {
                RadialGradient(gradient: Gradient(colors: [Color.white ,Color("light")]), center: .center, startRadius: 1, endRadius: radius)
                    .opacity(opacity)
                
                    .mask {
                        Image("light")
                            .resizableToFit()
                            .luminanceToAlpha()
                        
                            .rotationEffect(.degrees(rotation))
                        
                    }
                    .animation(.easeInOut(duration: 3), value: radius)
                    .animation(.easeInOut(duration: 2), value: opacity)
                    .animation(.smooth(duration: 2), value: rotation)
                    .offset(y : 0)
                
                Image("key\(vm.element)")
                    .resizableToFit()
                    .frame(width: vm.size.width * 0.45)
                    .opacity(opacity)
                    .animation(.easeInOut(duration: 2), value: opacity)
            }
            .offset(y: -vm.size.height *  endData[vm.element-1].lightCoef)
         
            
            VStack {
                Spacer()
                
                Image("welcometxtbg\(vm.element)")
                    .resizableToFit()
                    .rotationEffect(vm.element == 4 ? Angle(degrees: 180) : Angle(degrees: 0) )
                    .scaleEffect(y: vm.element == 4 ? 0.9 : 1, anchor: .bottom)
                    .overlay {
                        Text(endTxt[vm.element - 1])
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                            .foregroundStyle(
                                vm.element == 1 ? Pallete.brownEarth :
                                    vm.element == 4 ? Pallete.brownAir : .white)
                            .font(.custom(.semiBold, size: vm.element < 3 ? 17 : 19))
                    }
                
                Button {
                    dismiss()
                } label: {
                    Image("greenbtnbg")
                        .resizableToFit()
                        .frame(height: 60)
                        .scaleEffect(x: 1.2)
                        .overlay {
                            Text("TO MENU")
                                .foregroundStyle(.white)
                                .font(.custom(.black, size: 31))
                                .offset(y: -6)
                                .shadow(color: Color("txtgreenshadow"), radius: 1, y: 2)
                                .shadow(color: .black.opacity(0.25), radius: 1)
                        }
                }
                .padding(.top)
            }
            .padding(.bottom, 20)
        }
        .onAppear {
            radius = 70
            opacity = 1
            rotation = 10
        }
    }
}

#Preview {
    EndGameView()
        .environmentObject(GameLogic())
}
