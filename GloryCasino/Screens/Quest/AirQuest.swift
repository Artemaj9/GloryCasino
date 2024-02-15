//
//  AirQuest.swift
//

import SwiftUI

struct AirQuest: View {
    @EnvironmentObject var vm: GameLogic
    
    var body: some View {
        ZStack {
            Image("airquestbg")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(1.005)
            
            Image("logo4")
                .resizableToFit()
                .frame(width: vm.size.width * 0.85)
                .offset(y: -vm.size.height * 0.39)
           
            ZStack {
                Image("aitem1")
                    .resizableToFit()
                    .frame(width: vm.size.height * 0.16)
                    .offset(x: -vm.size.width * 0.32 ,y: -vm.size.height * 0.2)
                
                Image("aitem2")
                    .resizableToFit()
                    .frame(width: vm.size.height * 0.16)
                    .offset(x: vm.size.width * 0.32 ,y: -vm.size.height * 0.2)
                
                Image("aitem3")
                    .resizableToFit()
                    .frame(width: vm.size.height * 0.16)
                    .offset(x: vm.size.width * 0 ,y: -vm.size.height * 0.12)
                
                Image("aitem4")
                    .resizableToFit()
                    .frame(width: vm.size.height * 0.16)
                    .offset(x: vm.size.width * 0.32 ,y: vm.size.height * 0)
                
                Image("aitem5")
                    .resizableToFit()
                    .frame(width: vm.size.height * 0.16)
                    .offset(x: -vm.size.width * 0.32 ,y: -vm.size.height * 0)
                
                Image("aitem8")
                    .resizableToFit()
                    .frame(width: vm.size.height * 0.16)
                    .offset(x: -vm.size.width * 0.32 ,y: vm.size.height * 0.2)
                
                
                Image("aitem7")
                    .resizableToFit()
                    .frame(width: vm.size.height * 0.16)
                    .offset(x: vm.size.width * 0 ,y: vm.size.height * 0.07)
                
                Image("aitem8")
                    .resizableToFit()
                    .frame(width: vm.size.height * 0.16)
                    .offset(x: vm.size.width * 0.32 ,y: vm.size.height * 0.2)
                
                Image("airlabel")
                    .resizableToFit()
                    .frame(width: vm.size.width * 0.7)
                    .offset(y: vm.size.height * 0.3)
                
                Image("airpointsbg")
                    .resizableToFit()
                    .frame(width: vm.size.width * 0.35)
                    .offset(y: vm.size.height * 0.38)
            }
            .offset(y: -vm.size.height * 0.03)
            
            Button {
            
            } label: {
                Image("greenbtnbg")
                    .resizableToFit()
                    .scaleEffect(x: 0.8, y: 1)
                    .frame(height: 60)
                    .overlay {
                        Text("BACK")
                            .foregroundStyle(.white)
                            .font(.custom(.black, size: 35))
                            .offset(y: -6)
                            .shadow(color: Color("txtgreenshadow"), radius: 1, y: 2)
                            .shadow(color: .black.opacity(0.25), radius: 1)
                    }
            }
            .offset(y: vm.size.height * 0.44)
         
        }
    }
}

#Preview {
    AirQuest()
        .environmentObject(GameLogic())
}
