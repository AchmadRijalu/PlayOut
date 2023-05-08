//
//  GameDashboardItem.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 03/04/23.
//

import SwiftUI

//struct GameDashboardItem: View {
//    let gameCard:Game
//    var body: some View {
////        RoundedRectangle(cornerRadius: 28).fill(.white).frame(maxWidth: .infinity, maxHeight: 700).padding(20)
//        VStack{
//            ZStack(alignment: .bottom){
//                Image(gameCard.image).resizable().fixedSize()
//                Rectangle()
//                    .fill(Gradient(colors: [.clear, .black]))
//                            .ignoresSafeArea()
//                VStack{
//                    Spacer()
//                    HStack{
//                        Text(gameCard.name).foregroundColor(.white).fontWeight(.bold).font(.system(size: 24)).frame(maxWidth: .infinity, alignment: .leading)
//                        Spacer()
//                        VStack{
//                            Text(gameCard.matchIndicator).foregroundColor(.white).fontWeight(.bold).font(.system(size: 12)).padding(.bottom, 28)
//
//                        }
//                    }
//                    HStack{
//                        Image(systemName: "square.and.arrow.down.fill").foregroundColor(.white).padding(.trailing)
//
//                        Text("\(gameCard.downloaded)k Downloaded").foregroundColor(.white).padding(.trailing)
//                        Text(gameCard.genre).padding(.all, 10).overlay( RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth:1)).foregroundColor(.white)
//                        Spacer()
//
//                    }
//
//                }.padding(EdgeInsets(top: 0, leading: 24, bottom: 40, trailing: 24))
//
//            }
//        }.frame(maxWidth: .infinity, maxHeight: 500).background(.black).cornerRadius(20).padding(20)
//    }
//}

//
//struct GameDashboardItem_Previews: PreviewProvider {
//    static var previews: some View {
//        GameDashboardItem()
//    }
//}
