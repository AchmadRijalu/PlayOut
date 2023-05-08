//
//  Beranda.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 04/04/23.
//

import SwiftUI

struct Beranda: View {
    @State private var searchText = "";
    @State  var isCheck = false
    @FocusState var isFocused: Bool
    @AppStorage("darkModeEnabled") private var darkmodeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled = false
    
    let allGames = ["Red Dead Redemption 2", "Resident Evil 7"]
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.white)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.white)]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
    
        
        
    }
    
    var body: some View {
        VStack(alignment: .leading){
            NavigationStack{
                ZStack{
                    Rectangle()
                        .fill(Gradient(colors: [Color("CustomColorSecond"), Color("CustomColor"), Color("CustomColorSecond"), .black]))
                        .ignoresSafeArea()
                    
                    ZStack{
                        ForEach(Game.data.reversed()) { card in
                            GameDashboardItem(gameCard: card).cornerRadius(20).padding(EdgeInsets(top: 10, leading: 12, bottom: 0, trailing: 12))
                        }
                    }
                    
                    VStack{
                        HStack{
                            NavigationLink(destination: ProfilePage(darkModeEnabled: $darkmodeEnabled, systemThemeEnabled: $systemThemeEnabled)){
                                Image(systemName: "person").font(.system(size: 24)).foregroundColor(.purple)
                            }
                            
                            Spacer()
                            //                            Text("Beranda").font(.system(size: 24, weight: .semibold)).foregroundColor(.white)
                            
                            
                            Image("playoutlogo").resizable().frame(width: 120, height: 40).fixedSize().foregroundColor(.purple)
                            
                            Spacer()
                            NavigationLink(destination: SearchPage(isPresented: .constant(true))){
                                Image(systemName: "magnifyingglass").font(.system(size: 24)).foregroundColor(.purple)
                            }
                            
                        }.frame(maxWidth: .infinity).background(.clear).padding(.horizontal, 12)
                        //                        HStack{
                        //                            Text("Find Your Game").font(.system(size: 32, weight: .bold)).foregroundColor(.white)
                        //
                        //                        }.padding(EdgeInsets(top: 20, leading: 20, boxttom: 0, trailing: 0))
                        Spacer()
                    }
                    
                    
                }
                .navigationTitle("Dashboard").navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Gradient(colors: [Color("CustomColor")]))
    }
}

struct GameDashboardItem: View {
    @State  var gameCard:Game
    var body: some View {
        //        RoundedRectangle(cornerRadius: 28).fill(.white).frame(maxWidth: .infinity, maxHeight: 700).padding(20)
        VStack{
            NavigationView(){
                NavigationLink(destination: GetGameDetailPage(ID: "j5Xv2lM9wes", gamePlayID: "puWTz8toRHc")) {
                    ZStack(alignment: .bottom){
                        Image(gameCard.image).resizable().frame(maxWidth: .infinity, maxHeight: .infinity)
                        Rectangle()
                            .fill(Gradient(colors: [.clear, .black]))
                            .ignoresSafeArea()
                        VStack(alignment:.leading){
                            Spacer()
                            HStack{
                                Text(gameCard.name).foregroundColor(.white).fontWeight(.bold).font(.system(size: 24)).frame(maxWidth: .infinity, alignment: .leading).multilineTextAlignment(.leading)
                                Spacer()
                                VStack{
                                    Text(gameCard.matchIndicator).foregroundColor(.white).fontWeight(.bold).font(.system(size: 12)).padding(.bottom, 28)
                                    
                                }
                            }
                            HStack{
                                Image(systemName: "square.and.arrow.down.fill").foregroundColor(.white).padding(.trailing)
                                
                                Text("\(String(gameCard.downloaded))k Downloaded").foregroundColor(.white).padding(.trailing)
                                Text(gameCard.genre).padding(.all, 10).overlay( RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth:1)).foregroundColor(.white)
                                Spacer()
                                
                            }
                            
                        }.padding(EdgeInsets(top: 0, leading: 24, bottom: 40, trailing: 24))
                        VStack{
                            HStack {
                                Text("Fav!!").foregroundColor(.white).opacity(Double(gameCard.x/10)).font(.system(size: 30, weight: .semibold))
                                Spacer()
                                Text("Skip!").foregroundColor(.white).opacity(Double(gameCard.x/10 * -1 - 1)).font(.system(size: 30, weight: .semibold))
                            }
                            Spacer()
                        }.padding(.all, 24)
                        
                        
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: 550).background(.black).cornerRadius(20).padding(20).offset(x: gameCard.x, y: gameCard.y)
                .rotationEffect(.init(degrees: gameCard.degree))
                .gesture (
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.default) {
                                gameCard.x = value.translation.width
                                
                                gameCard.y = value.translation.height
                                gameCard.degree = 7 * (value.translation.width > 0 ? 1 : -1)
                            }
                        }
                        .onEnded { (value) in
                            withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                                switch value.translation.width {
                                case 0...100:
                                    gameCard.x = 0; gameCard.degree = 0; gameCard.y = 0
                                case let x where x > 100:
                                    gameCard.x = 500; gameCard.degree = 12
                                case (-100)...(-1):
                                    gameCard.x = 0; gameCard.degree = 0; gameCard.y = 0
                                case let x where x < -100:
                                    gameCard.x  = -500; gameCard.degree = -12
                                default:
                                    gameCard.x = 0; gameCard.y = 0
                                }
                            }
                        }
                )
            
        }
        
    }
}

struct Beranda_Previews: PreviewProvider {
    static var previews: some View {
        Beranda()
    }
}

