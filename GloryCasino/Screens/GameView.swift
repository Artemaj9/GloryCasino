//
//  GameView.swift
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var vm: GameLogic
    
    @State var newPosition1: CGFloat = 0
    @State var newPosition2: CGFloat = 0
    @State var newPosition3: CGFloat = 0
    @State var newPosition4: CGFloat = 0
    @State var newPosition5: CGFloat = 0
    @State var slotSize: CGSize = .zero
    @State var enabledSpin = true
    @State var iteration = 0
 
    var body: some View {
        ZStack {
            Image("gamebg\(vm.element)")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .scaleEffect(1.005)
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        if vm.isSound {
                            playSound(key: "slotsound", player: &player)
                        }
                        withAnimation {
                            enabledSpin = false
                        }
                        vm.resetLuckyLines()
                        if iteration > 0 {
                            for i in 0...4 {
                                for j in 0...2 {
                                    vm.itemsMatrix[i][49 - j] = vm.currentMatrix[i][j]
                                }
                                vm.newPosition[i] = 0
                            }
                            vm.fillItems(isFirst: false)
                        }
                        iteration += 1
                    
                        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { timer in
                            withAnimation {
                                enabledSpin = true
                                print(vm.currentMatrix)
                                
                                vm.calculatePayout()
                            }
                        }
                        
                        withAnimation(.spring(response: 1.8, dampingFraction: 0.8)) {
                            let newindex =  Int.random(in: 20...30)
                            vm.newPosition[0] = CGFloat(90 * newindex)
                            newPosition1 = CGFloat(90 * newindex)
                            vm.currentMatrix[0][0] = vm.itemsMatrix[0][49 - newindex]
                            vm.currentMatrix[0][1] = vm.itemsMatrix[0][49 - newindex - 1]
                            vm.currentMatrix[0][2] = vm.itemsMatrix[0][49 - newindex - 2]
                        }
                        
                        withAnimation(.spring(response: 1.7, dampingFraction: 0.7).delay(0.3)) {
                            let newindex =  Int.random(in: 20...30)
                            vm.newPosition[1] = CGFloat(90 * newindex)
                            vm.currentMatrix[1][0] = vm.itemsMatrix[1][49 - newindex]
                            
                            vm.currentMatrix[1][1] = vm.itemsMatrix[1][49 - newindex - 1]

                            vm.currentMatrix[1][2] = vm.itemsMatrix[1][49 - newindex - 2]
                        }
                        
                        withAnimation(.spring(response: 1.7, dampingFraction: 0.8).delay(0.6)) {
                            let newindex =  Int.random(in: 20...30)
                            vm.newPosition[2] = CGFloat(90 * newindex)
                            vm.currentMatrix[2][0] = vm.itemsMatrix[2][49 - newindex]
                            vm.currentMatrix[2][1] = vm.itemsMatrix[2][49 - newindex - 1]
                            vm.currentMatrix[2][2] = vm.itemsMatrix[2][49 - newindex - 2]
                        }
                        
                        withAnimation(.spring(response: 1.5, dampingFraction: 0.8).delay(0.9)) {
                            let newindex =  Int.random(in: 20...30)
                            vm.newPosition[3] = CGFloat(90 * newindex)
                            vm.currentMatrix[3][0] = vm.itemsMatrix[3][49 - newindex]
                            vm.currentMatrix[3][1] = vm.itemsMatrix[3][49 - newindex - 1]
                            vm.currentMatrix[3][2] = vm.itemsMatrix[3][49 - newindex - 2]
                        }
                        
                        withAnimation(.spring(response: 1.5, dampingFraction: 0.8).delay(1.2)) {
                            let newindex =  Int.random(in: 20...30)
                          
                            vm.newPosition[4] = CGFloat(90 * newindex)
                            vm.currentMatrix[4][0] = vm.itemsMatrix[4][49 - newindex]
                            vm.currentMatrix[4][1] = vm.itemsMatrix[4][49 - newindex - 1]
                            vm.currentMatrix[4][2] = vm.itemsMatrix[4][49 - newindex - 2]
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
                    .opacity(enabledSpin ? 1 : 0.5 )
                    .disabled(!enabledSpin)
                }
            }
            
            Image("bgslot\(vm.element)")
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
                                        ForEach(1..<51) { i in
                                            Image("\(element[vm.element - 1])slot\(vm.itemsMatrix[0][i-1])")
                                                .resizableToFit()
                                                .frame(width: 70, height: 90)
                                                .overlay {
                                                    Color.green.opacity(0.4)
                                                        .blur(radius: 3)
                                                        .frame(width: 9)
                                                        .opacity(vm.luckyVlines[0] ? 1 : 0)
                                                }
                                                }
                                        }
                                     .offset(y: -35)
                                     .offset(y: -4140)
                                     .offset(y: vm.newPosition[0])
                                    
                            }
                        .allowsHitTesting(false)
                        
                        ScrollView(showsIndicators: false) {
                                    VStack(spacing: 0) {
                                        ForEach(1..<51) { i in
                                            Image("\(element[vm.element - 1])slot\(vm.itemsMatrix[1][i-1])")
                                                .resizableToFit()
                                                .frame(width: 70, height: 90)
                                                .overlay {
                                                    Color.green.opacity(0.4)
                                                        .blur(radius: 3)
                                                        .frame(width: 9)
                                                        .opacity(vm.luckyVlines[1] ? 1 : 0)
                                                }
                                                
                                                }
                                        }
                                     .offset(y: -35)
                                     .offset(y: -4140)
                                     .offset(y: vm.newPosition[1])
                            }
                        .allowsHitTesting(false)
                        
                        ScrollView(showsIndicators: false) {
                                    VStack(spacing: 0) {
                                        ForEach(1..<51) { i in
                                            Image("\(element[vm.element - 1])slot\(vm.itemsMatrix[2][i-1])")
                                                .resizableToFit()
                                                .frame(width: 70, height: 90)
                                                .overlay {
                                                    Color.green.opacity(0.4)
                                                        .blur(radius: 3)
                                                        .frame(width: 9)
                                                        .opacity(vm.luckyVlines[2] ? 1 : 0)
                                                }
                                                
                                                }
                                        }
                                     .offset(y: -35)
                                     .offset(y: -4140)
                                     .offset(y: vm.newPosition[2])
                                    
                            }
                        .allowsHitTesting(false)
                        
                        ScrollView(showsIndicators: false) {
                                    VStack(spacing: 0) {
                                        ForEach(1..<51) { i in
                                            Image("\(element[vm.element - 1])slot\(vm.itemsMatrix[3][i-1])")
                                                .resizableToFit()
                                                .frame(width: 70, height: 90)
                                                .overlay {
                                                    Color.green.opacity(0.4)
                                                        .blur(radius: 3)
                                                        .frame(width: 9)
                                                        .opacity(vm.luckyVlines[3] ? 1 : 0)
                                                }
                                                
                                                }
                                        }
                                     .offset(y: -35)
                                     .offset(y: -4140)
                                     .offset(y: vm.newPosition[3])
                                    
                            }
                        .allowsHitTesting(false)
                        
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 0) {
                                ForEach(1..<51) { i in
                                    Image("\(element[vm.element - 1])slot\(vm.itemsMatrix[4][i-1])")
                                        .resizableToFit()
                                        .frame(width: 70, height: 90)
                                        .overlay {
                                            Color.green.opacity(0.4)
                                                .blur(radius: 3)
                                                .frame(width: 9)
                                                .opacity(vm.luckyVlines[4] ? 1 : 0)
                                        }
                                    
                                }
                            }
                            .offset(y: -35)
                            .offset(y: -4140)
                            .offset(y: vm.newPosition[4])
                            
                        }
                        .allowsHitTesting(false)
                    }
                    .mask {
                        Color.white
                            .frame(height: 300)
                    }
                }
                .overlay {
                    ZStack {
                        ZStack {
                            Color.pink.opacity(0.7)
                                .blur(radius: 10)
                                .frame(height:  9)
                                .rotationEffect(Angle(radians: Double(atan2(250, vm.size.width/2))), anchor: .leading)
                                .offset(y: -135)
                            Color.pink.opacity(0.7)
                                .blur(radius: 10)
                                .frame(height:  9)
                                .rotationEffect(Angle(radians:  Double(-atan2(250, vm.size.width/2))), anchor: .trailing)
                                .offset(y: -135)
                        }
                        .opacity(vm.luckyVShapes[1] ? 1 : 0)
                      
                        
                        ZStack {
                            Color.purple
                                .blur(radius: 8)
                                .frame(height:  9)
                                .rotationEffect(Angle(radians: Double(atan2(250, vm.size.width/2))), anchor: .leading)
                                .offset(y: -135)
                            Color.purple
                                .blur(radius: 8)
                                .frame(height:  9)
                                .rotationEffect(Angle(radians:  Double(-atan2(250, vm.size.width/2))), anchor: .trailing)
                                .offset(y: -135)
                        }
                        .rotationEffect(.degrees(180))
                        .offset(y: 24)
                        .opacity(vm.luckyVShapes[0] ? 1 : 0)
                    }
                }
            
         
            .mask {
                Image("bgslot\(vm.element)")
                    .resizableToFit()
            }
            
            Color.yellow.opacity(0.7)
                .blur(radius: 5)
                .frame(height:  9)
                .offset(y: vm.size.height * 0.02 - 90)
                .opacity(vm.luckyHLines[2] ? 1 : 0)
            
            Color.yellow.opacity(0.7)
                .blur(radius: 5)
                .frame(height:  9)
                .offset(y: vm.size.height * 0.02)
                .opacity(vm.luckyHLines[1] ? 1 : 0)
            
            Color.yellow.opacity(0.7)
                .blur(radius: 5)
                .frame(height:  9)
                .offset(y: vm.size.height * 0.02 + 90)
                .opacity(vm.luckyHLines[0] ? 1 : 0)
        }
        .onAppear {
            vm.fillItems(isFirst: true)
        }
     
    }
    
    func detectElementInPosition(_ new: CGFloat) -> Int {
        let index = 4 - (Int(new) % 900)/90
        switch index {
        case 0: return 10
        case ..<0: return (10 + index)
        default: return index
        }
    }
}

#Preview {
    GameView()
        .environmentObject(GameLogic())
}
