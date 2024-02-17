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
                        withAnimation {
                            enabledSpin = false
                        }
                        
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
//                        vm.itemsMatrix[1][49] = vm.currentMatrix[1][0]
//                        vm.itemsMatrix[1][48] = vm.currentMatrix[1][1]
//                        vm.itemsMatrix[1][47] = vm.currentMatrix[1][2]
                     
//                        newPosition1 = 0
//                        newPosition2 = 0
//                        newPosition3 = 0
//                        newPosition4 = 0
//                        newPosition5 = 0
//                        
                      //  vm.itemsMatrix[1][49] =
                        //newPosition1 = CGFloat(Int(newPosition1) % 900)
                       // newPosition2 = CGFloat(Int(newPosition2) % 900)
                       // newPosition3 = CGFloat(Int(newPosition3) % 900)
//                        newPosition4 = CGFloat(Int(newPosition4) % 900)
//                        newPosition5 = CGFloat(Int(newPosition5) % 900)
                    
                        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { timer in
                            withAnimation {
                                enabledSpin = true
                                print(vm.currentMatrix)
                            }
                        }
                        
                        print("You win!")
                
                        
                        withAnimation(.spring(response: 1.8, dampingFraction: 0.8)) {
                            let newindex =  Int.random(in: 20...30)
                            vm.newPosition[0] = CGFloat(90 * newindex)
                            newPosition1 = CGFloat(90 * newindex)
                           // print("Position 1:  \(49 - newindex)")
                           // print("bottom element: \(vm.itemsMatrix[0][49 - newindex])")
                           // print("central element: \(vm.itemsMatrix[0][49 - newindex - 1])")
                           // print("top element: \(vm.itemsMatrix[0][49 - newindex - 2])")
                            vm.currentMatrix[0][0] = vm.itemsMatrix[0][49 - newindex]
                            vm.currentMatrix[0][1] = vm.itemsMatrix[0][49 - newindex - 1]
                            vm.currentMatrix[0][2] = vm.itemsMatrix[0][49 - newindex - 2]
                        }
                        
                        withAnimation(.spring(response: 1.7, dampingFraction: 0.7).delay(0.3)) {
                            let newindex =  Int.random(in: 20...30)
                            vm.newPosition[1] = CGFloat(90 * newindex)
                          //  print("Position 2:  \(detectElementInPosition(newPosition2))")
                            vm.currentMatrix[1][0] = vm.itemsMatrix[1][49 - newindex]
                           // print("current matrix row 2 bottom: \( vm.currentMatrix[1][0])")
                            vm.currentMatrix[1][1] = vm.itemsMatrix[1][49 - newindex - 1]
                         //   print("current matrix row 2 center: \( vm.currentMatrix[1][1])")
                            vm.currentMatrix[1][2] = vm.itemsMatrix[1][49 - newindex - 2]
                          //  print("current matrix row 2 top: \( vm.currentMatrix[1][2])")
                        }
                        
                        withAnimation(.spring(response: 1.7, dampingFraction: 0.8).delay(0.6)) {
                            let newindex =  Int.random(in: 20...30)
                            vm.newPosition[2] = CGFloat(90 * newindex)
                            vm.currentMatrix[2][0] = vm.itemsMatrix[2][49 - newindex]
                            vm.currentMatrix[2][1] = vm.itemsMatrix[2][49 - newindex - 1]
                            vm.currentMatrix[2][2] = vm.itemsMatrix[2][49 - newindex - 2]
//                            print("Position 3:  \(detectElementInPosition(newPosition3))")
                        }
                        
                        withAnimation(.spring(response: 1.5, dampingFraction: 0.8).delay(0.9)) {
                            let newindex =  Int.random(in: 20...30)
                            vm.newPosition[3] = CGFloat(90 * newindex)
                            vm.currentMatrix[3][0] = vm.itemsMatrix[3][49 - newindex]
                            vm.currentMatrix[3][1] = vm.itemsMatrix[3][49 - newindex - 1]
                            vm.currentMatrix[3][2] = vm.itemsMatrix[3][49 - newindex - 2]
                           // print("Position 4:  \(detectElementInPosition(newPosition4))")
                        }
                        
                        withAnimation(.spring(response: 1.5, dampingFraction: 0.8).delay(1.2)) {
                            let newindex =  Int.random(in: 20...30)
                          
                            vm.newPosition[4] = CGFloat(90 * newindex)
                            vm.currentMatrix[4][0] = vm.itemsMatrix[4][49 - newindex]
                            vm.currentMatrix[4][1] = vm.itemsMatrix[4][49 - newindex - 1]
                            vm.currentMatrix[4][2] = vm.itemsMatrix[4][49 - newindex - 2]
                           // print("Position 5:  \(detectElementInPosition(newPosition5))")
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
                                        ForEach(1..<51) { i in
                                            Image("earthslot\(vm.itemsMatrix[0][i-1])")
                                                .resizableToFit()
                                                .frame(width: 70, height: 90)
                                                
                                                }
                                        }
                                     .offset(y: -35)
                                     .offset(y: -4140)
                                     .offset(y: vm.newPosition[0])
                                    
                            }
                        ScrollView(showsIndicators: false) {
                                    VStack(spacing: 0) {
                                        ForEach(1..<51) { i in
                                            Image("earthslot\(vm.itemsMatrix[1][i-1])")
                                                .resizableToFit()
                                                .frame(width: 70, height: 90)
                                                
                                                }
                                        }
                                     .offset(y: -35)
                                     .offset(y: -4140)
                                     .offset(y: vm.newPosition[1])
                            }
                        
                        ScrollView(showsIndicators: false) {
                                    VStack(spacing: 0) {
                                        ForEach(1..<51) { i in
                                            Image("earthslot\(vm.itemsMatrix[2][i-1])")
                                                .resizableToFit()
                                                .frame(width: 70, height: 90)
                                                
                                                }
                                        }
                                     .offset(y: -35)
                                     .offset(y: -4140)
                                     .offset(y: vm.newPosition[2])
                                    
                            }
                        ScrollView(showsIndicators: false) {
                                    VStack(spacing: 0) {
                                        ForEach(1..<51) { i in
                                            Image("earthslot\(vm.itemsMatrix[3][i-1])")
                                                .resizableToFit()
                                                .frame(width: 70, height: 90)
                                                
                                                }
                                        }
                                     .offset(y: -35)
                                     .offset(y: -4140)
                                     .offset(y: vm.newPosition[3])
                                    
                            }
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 0) {
                                ForEach(1..<51) { i in
                                    Image("earthslot\(vm.itemsMatrix[4][i-1])")
                                        .resizableToFit()
                                        .frame(width: 70, height: 90)
                                    
                                }
                            }
                            .offset(y: -35)
                            .offset(y: -4140)
                            .offset(y: vm.newPosition[4])
                            
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
