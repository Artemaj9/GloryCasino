//
//  FireQuest.swift
//

import SwiftUI

struct FireQuest: View {
    
    @EnvironmentObject var vm: GameLogic
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Image("questbg2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(1.005)
            
            ZStack {
                ZStack {
                    Image("fitem1")
                        .resizableToFit()
                        .frame(height: 200)
                        .offset(y: -150)
                        .opacity(vm.allItems[1][0] ? 0 : 1)
                    Image("fopen1")
                        .resizableToFit()
                        .frame(height: 200)
                        .offset(y: -150)
                        .opacity(vm.allItems[1][0] ? 1 : 0)
                }
                
                ZStack {
                    Image("fitem3")
                        .resizableToFit()
                        .frame(height: 200)
                        .offset(x: 70, y: -90)
                        .opacity(vm.allItems[1][2] ? 0 : 1)
                    Image("fopen3")
                        .resizableToFit()
                        .frame(height: 200)
                        .offset(x: 70, y: -90)
                        .opacity(vm.allItems[1][2] ? 1 : 0)
                }
                
                ZStack {
                    Image("fitem5")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: 100)
                        .opacity(vm.allItems[1][4] ? 0 : 1)
                    Image("fopen5")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: 100)
                        .opacity(vm.allItems[1][4] ? 1 : 0)
                }
                
                ZStack {
                    Image("fitem7")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: 80, y: 80)
                        .opacity(vm.allItems[1][6] ? 0 : 1)
                    
                    Image("fopen7")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: 80, y: 80)
                        .opacity(vm.allItems[1][6] ? 1 : 0)
                    
                }
                
                ZStack {
                    Image("fitem8")
                        .resizableToFit()
                        .frame(width: 100)
                        .offset(y: 150)
                        .opacity(vm.allItems[1][7] ? 0 : 1)
                    
                    Image("fopen8")
                        .resizableToFit()
                        .frame(width: 100)
                        .offset(y: 150)
                        .opacity(vm.allItems[1][7] ? 1 : 0)
                }
                
                ZStack {
                    Image("fitem6")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: -90, y: 90)
                        .opacity(vm.allItems[1][5] ? 0 : 1)
                    
                    Image("fopen6")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: -90, y: 90)
                        .opacity(vm.allItems[1][5] ? 1 : 0)
                   
                }
                
                ZStack {
                    Image("fitem4")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: -100)
                        .opacity(vm.allItems[1][3] ? 0 : 1)
                    Image("fopen4")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: -100)
                        .opacity(vm.allItems[1][3] ? 1 : 0)
                }
                
                ZStack {
                    Image("fitem2")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: -70, y: -70)
                        .opacity(vm.allItems[1][1] ? 0 : 1)
                    
                    Image("fopen2")
                        .resizableToFit()
                        .frame(width: 200)
                        .offset(x: -70, y: -70)
                        .opacity(vm.allItems[1][1] ? 1 : 0)
                }
                
                Image("center")
                    .resizableToFit()
                    .frame(width: 190)
            }
            .offset(y: -50)
            
            
            Group {
                Text("\(vm.allItems[vm.element-1].filter{$0}.count)")
                    .foregroundColor(.white)
                    .font(.custom(.black, size: 41))
                +
                Text("/8")
                    .font(.custom(.black, size: 27))
                    .foregroundColor(.white)
            }
            .shadow(color: .black.opacity(0.25), radius: 2, y: 2)
            .offset(y:  vm.size.height*0.32)
     
            Button {
                if vm.allItems[vm.element-1].filter{$0}.count == 8 {
                    vm.showkey[1] = true
                }
                dismiss()
            } label: {
                Image("backbtn")
                    .resizableToFit()
                    .frame(width: vm.size.width * 0.4)
            }
            .offset(y: vm.size.height*0.42)
            
            

        }
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
    }
}

#Preview {
    FireQuest()
}
