//
//  FavoritePage.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 04/04/23.
//

import SwiftUI

struct FavoritePage: View {
    @State private var searchText:String = ""
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.white)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.white)]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        print("halo")
        
        
    }
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(){
                    NavigationLink(destination: GetGameDetailPage(ID: "j5Xv2lM9wes", gamePlayID: "puWTz8toRHc")){
                        FavoriteItem(image: "re4", name: "Resident Evil 4 Remake", genre: "Action")
                            .navigationTitle("Favorites")
                    }
                    
                    FavoriteItem(image: "hl", name: "Hogwarts Legacy", genre:  "RPG")
                    FavoriteItem(image: "rdr2", name: "Red Dead Redemption 2", genre: "Adventure")
                        .navigationTitle("Favorites")
                }.foregroundColor(.white)
                Spacer()
                
            }.padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20)).frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("CustomColor"))
            
                .searchable(text: $searchText, prompt: "Search")
            
        }
        
    }
}





struct FavoriteItem:View{
    var image:String
    var name:String
    var genre:String
    
    var body: some View{
        VStack {
            HStack{
                Image(image).resizable().frame(width: 70, height: .infinity).scaledToFit().cornerRadius(12)
                VStack{
                    HStack{
                        Text(name).font(.system(size: 16, weight: .medium))
                        Spacer()
                    }.padding(.top, 8)
                    Spacer()
                    HStack{
                        Text(" \(String(genre))").foregroundColor(.white  ).fontWeight(.semibold).padding(.all, 7).background(.clear ).cornerRadius(10).overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color(.white), lineWidth: 1)
                        )
                      
                        Spacer()
                    }
                }.padding(.leading, 8)
                Image(systemName: "heart.fill").padding(.all, 8).font(.system(size: 24)).foregroundColor(.purple).padding(.trailing,4)
            }
        }.padding(.all, 6).frame(width: 329, height: 80).background(Color("CustomColorSecond")).cornerRadius(12).padding(.bottom, 12)
        
        
    }
}

struct FavoritePage_Previews: PreviewProvider {
    static var previews: some View {
        FavoritePage()
    }
}
