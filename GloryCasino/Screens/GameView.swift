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
            
            VStack(spacing: 8) {
                HStack {
                    Button {
                        withAnimation {
                            vm.isPaused = true
                        }
                     
                    } label: {
                        Image("burgerbtn")
                            .resizableToFit()
                            .frame(height: 45)
                    }

                    Image("balancebar")
                        .resizableToFit()
                        .frame(height: 60)
                        .overlay {
                            Text("\(vm.balance)")
                                .foregroundStyle(.white)
                                .font(.custom(.black, size: 24))
                        }
                    
                    NavigationLink {
                        switch vm.element {
                        case 1: EarthQuest()
                                .environmentObject(vm)
                        case 2: FireQuest()
                                .environmentObject(vm)
                        case 3: WaterQuest()
                                .environmentObject(vm)
                        default: AirQuest()
                                .environmentObject(vm)
                        }
                        //ChestView()
                            
                    } label: {
                        Image("cup")
                            .resizableToFit()
                            .frame(height: 45)
                    }
                }
                HStack {
                    Spacer()
                    Image("jp\(vm.element)")
                        .resizableToFit()
                        .frame(height: 75)
                        .overlay(alignment: .bottom) {
                            ZStack {
                                if vm.element == 4 {
                                    Color("orangejp")
                                } else {
                                    Color.yellow
                                }
                            }
                           
                                .frame(height: 36)
                                .mask {
                                    Text("\(vm.jackpots[vm.element - 1])")
                                        .font(.custom(vm.element >= 3 ? .kotto : .semiBold, size: 18))
                                        .offset(x: 8, y: -4)
                                }
                        }
                }
                
                HStack {
                    Spacer()
                    Image("grand\(vm.element)")
                        .resizableToFit()
                        .frame(height: 60)
                        .overlay(alignment: .bottom) {
                            ZStack {
                                if vm.element == 4 {
                                    Color.red
                                } else {
                                    Color.yellow
                                }
                            }
                                .frame(height: 36)
                                .mask {
                                    Text("\(Int(vm.bet * 200))")
                                        .font(.custom(vm.element >= 3 ? .kotto : .semiBold, size: 15))
                                        .offset(x: 8, y: 0)
                                }
                        }
                }
                
                HStack {
                    Spacer()
                    Image("mini\(vm.element)")
                        .resizableToFit()
                        .frame(height: 40)
                        .overlay(alignment: .bottom) {
                            ZStack {
                                if vm.element == 4 {
                                    Color("greenjp")
                                } else {
                                    Color.yellow
                                }
                            }
                                .frame(height: 20)
                                .mask {
                                    Text("\(Int(vm.bet * 0.2))")
                                        .font(.custom(vm.element >= 3 ? .kotto : .semiBold, size: 14))
                                        .offset(x: 8, y: -1)
                                }
                            
                        }
                }
                
                HStack {
                    Image("pearth1")
                        .resizableToFit()
                        .frame(height: 70)
                }
                Spacer()
            }
            .padding(.top, vm.size.height * 0.05)
        
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
            .offset(y: vm.size.height * 0.1)
            
            Color.yellow.opacity(0.7)
                .blur(radius: 5)
                .frame(height:  9)
                .offset(y: vm.size.height * 0.12 - 90)
                .opacity(vm.luckyHLines[2] ? 1 : 0)
            
            Color.yellow.opacity(0.7)
                .blur(radius: 5)
                .frame(height:  9)
                .offset(y: vm.size.height * 0.12)
                .opacity(vm.luckyHLines[1] ? 1 : 0)
            
            Color.yellow.opacity(0.7)
                .blur(radius: 5)
                .frame(height:  9)
                .offset(y: vm.size.height * 0.12 + 90)
                .opacity(vm.luckyHLines[0] ? 1 : 0)
            
            Image("gamebar")
                .resizableToFit()
                .overlay(alignment: .top) {
                    HStack(spacing: 0) {
                        Image("win")
                            .resizableToFit()
                            .frame(height: 54)
                            .blendMode(.plusDarker)
                            .opacity(0.4)
                            .overlay {
                             yellowGrad
                                    .mask {
                                        Text("\(vm.totalWin[vm.element - 1])")
                                            .font(.custom(.black, size: 24))
                                            
                                    }
                            }
                            .offset(x: 16, y: -4)
                      
                        
                        Image("mod")
                            .resizableToFit()
                            .frame(height: 54)
                            .offset(x: -16, y: -4)
                            .overlay(alignment: .top) {
                                Group {
                                    Text("x")
                                        .font(.custom(.black, size: 16))
                                    +
                                    
                                    Text("\(String(format: "%.1f",vm.winCoef))")
                                      
                                        .font(.custom(.black, size: 22))
                                }
                                .foregroundStyle(.white)
                                    .offset(x: -12, y: 8)
                            }
                            
                        
                    }
                }
                .overlay(alignment: .bottom) {
                    HStack {
                        Image("betplank")
                            .resizableToFit()
                            .blendMode(.plusDarker)
                            .opacity(0.4)
                            .frame(width: vm.size.width * 0.5)
                            .scaleEffect(x: 0.85, y: 1.1)
                            .overlay {
                                VStack {
                                    Text("\(Int(vm.bet))")
                                        .font(.custom(.black, size: 18))
                                        .foregroundStyle(.white)
                                    Text("TOTAL BET")
                                        .font(.custom(.black, size: 12))
                                        .foregroundStyle(.white)
                                }
                            }
                            .overlay(alignment: .leading) {
                                Button {
                                    if vm.bet < 100 && vm.bet >= 10 {
                                        vm.bet -= 10
                                        vm.balance += 10
                                    } else if vm.bet >= 100 {
                                        vm.bet -= 100
                                        vm.balance += 100
                                    }
                                } label: {
                                    Image("minusbtn")
                                        .resizableToFit()
                                        .frame(width: 28, height: 50)
                                        .offset(x: 4)
                                }
                            }
                            .overlay(alignment: .trailing) {
                                Button {
                                    if vm.balance >= 100 {
                                        vm.balance -= 100
                                        vm.bet += 100
                                    } else if vm.balance >= 10 && vm.balance < 100 {
                                        vm.balance -= 10
                                        vm.bet += 10
                                    }
                                } label: {
                                    Image("plusbtn")
                                        .resizableToFit()
                                        .frame(width: 28, height: 50)
                                        .offset(x: -4)
                                }
                            }
                            .offset(y: -vm.size.height * 0.02)
                            .offset(x: 12)
                            
                        
                        
                        Spacer()
                    }
                    .offset(y: -vm.size.height * 0.01)
                }
                .offset(y: vm.size.height * 0.4)
               
            
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
                            .frame(height: 50)
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
                    .offset(y: -vm.size.height * 0.01)
                }
            }
            .offset(x: -vm.size.width * 0.02 ,y: -vm.size.height * 0.03)
            
            if vm.showWinItem {
                switch vm.element {
                case 1: EarthWin()
                        .environmentObject(vm)
                case 2: FireWin()
                        .environmentObject(vm)
                case 3: WaterWin()
                        .environmentObject(vm)
                default: AirWin()
                        .environmentObject(vm)
                }
            }
            
            if vm.showkey {
                EndGameView()
                    .environmentObject(vm)
            }
            
            if vm.isPaused {
                PauseView()
                    .environmentObject(vm)
                    .transition(.blur)
            }
        }
        .onAppear {
            vm.fillItems(isFirst: true)
            vm.allItems[0][1] = true
            vm.allItems[0][2] = true
            vm.allItems[0][3] = true
            vm.allItems[0][4] = true
            vm.allItems[0][5] = true
            vm.allItems[0][6] = true
            vm.allItems[0][7] = true
            
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
