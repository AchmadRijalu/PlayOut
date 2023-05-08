//
//  DetailsPage.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 04/04/23.
//

import SwiftUI

struct DetailsPage: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Details").font(.system(size: 23, weight: .semibold)).foregroundColor(.white).padding(.bottom, 12)
                Spacer()
            }
            
            HStack{
                VStack(alignment: .leading , spacing: 8){
                    HStack{
                        Text("Ages").font(.system(size: 14, weight: .bold)).foregroundColor(.white).padding(.trailing, 64)
                        VStack(alignment:.leading){
                            Text("+21").font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                        }
                        
                    }
                    HStack{
                        Text("Developer").font(.system(size: 14, weight: .bold)).foregroundColor(.white).padding(.trailing, 33)
                        VStack(alignment:.leading){
                            Text("Capcom").font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                        }
                        
                    }
                    HStack{
                        Text("Year Release").font(.system(size: 14, weight: .bold)).foregroundColor(.white).padding(.trailing, 15)
                        
                        Text("2021").font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                        
                       
                    }
                       
                    HStack{
                        Text("Platform").font(.system(size: 14, weight: .bold)).foregroundColor(.white).padding(.trailing, 44)
                        VStack(alignment: .leading){
                            Text("Steam, Epic Games, Playstation, Appstore").font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                        }
                       
                    }
                }

            }

            Spacer()
        }
    }
}

struct DetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPage()
    }
}
