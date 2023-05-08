//
//  SearchPage.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 04/04/23.
//

import SwiftUI

struct SearchPage: View {
    @State private var searchText = ""
    
    @Binding var isPresented: Bool
    @FocusState private var searchFocus: Bool
    @State private var showModal = false
    
    var body: some View {
        
        NavigationStack {
            
            if searchText != ""{
                //                ChildView()
                //                Text("Searching for \(searchText)")
                ScrollView{
                    VStack(spacing: 20){
                        HStack{
                            NavigationLink(destination: GetGameDetailPage(ID: "j5Xv2lM9wes", gamePlayID: "puWTz8toRHc")){
                                OnsearchingItem(image: "rdr2", name: "Red Dead Redemption 2", price: "40").padding(.trailing, 2)
                            }
                            
                            OnsearchingItem(image: "re4", name: "Resident Evil 4 Remake", price: "80")
                            
                        }.padding(.leading, 8)
                        HStack{
                            Spacer()
                            OnsearchingItem(image: "destiny2", name: "Destiny 2", price: "20").padding(.trailing, 2)
                            OnsearchingItem(image: "hl", name: "Hogwarts Legacy",  price: "40")
                            Spacer()
                        }
                        HStack{
                            Spacer()
                            OnsearchingItem(image: "tk8", name: "Tekken 8",  price: "100").padding(.trailing, 2)
                            OnsearchingItem(image: "cs2", name: "Counter Strike 2",  price: "10")
                            Spacer()
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity).padding(.top, 16).background(Color("CustomColor"))
                }.background(Color("CustomColor"))
            }
            else{
                ScrollView {
                    VStack(){
                        //
                        HStack{
                            VStack(spacing: 16){
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    VStack{
                                        Text("Adventure")
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    VStack{
                                        Text("Action")
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    VStack{
                                        Text("Horror")
                                    }
                                    Spacer()
                                }
                                
                            }
                            VStack(spacing: 16){
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    VStack{
                                        Text("Sports")
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    VStack{
                                        Text("RPG")
                                    }
                                    Spacer()
                                }
                                HStack{
                                    Image(systemName: "magnifyingglass")
                                    VStack{
                                        Text("Multiplayer")
                                    }
                                    Spacer()
                                }
                                
                            }
                            
                            
                        }.foregroundColor(.white)
                        
                        Spacer()
                        
                    }.padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20)).frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("CustomColor"))
                    NavigationLink(destination: GetGameDetailPage(ID: "j5Xv2lM9wes", gamePlayID: "puWTz8toRHc")){
                        SearchItem(image: "hl").padding(.bottom, 12)
                    }
                    
                    SearchItem(image: "re4").padding(.bottom, 12)
                    SearchItem(image: "destiny2").padding(.bottom, 12)
                }.background(Color("CustomColor"))
                
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Image(systemName: "slider.horizontal.3").foregroundColor(Color(.magenta)).onTapGesture {
                                withAnimation(.easeIn){
                                    showModal = true
                                }
                                
                            }
                            
                            
                        }
                        
                    }.sheet(isPresented: $showModal) {
                        ModalView()
                    }
            }
            
            EmptyView()
                .navigationTitle("Dashboard")
            
            
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always) ).focused($searchFocus).background(.white)
            
            
        }
        
    }
}
struct SearchItem: View {
    let image:String
    var body: some View {
        VStack{
            Image(image).resizable().scaledToFill()
        }.frame(width: 329, height: 91).cornerRadius(8).shadow(color: .indigo, radius: 7, x: 1, y: 5)
    }
}

struct OnsearchingItem: View {
    let image:String
    let name:String
    let price:String
    var body: some View {
        VStack{
            VStack{
                Image(image).resizable().scaledToFill()
            }.frame(width: 157, height: 206).cornerRadius(8).shadow(color: .indigo, radius: 7, x: 1, y: 3)
            
            VStack(alignment: .leading){
                Text(name).foregroundColor(.white).font(.system(size: 20, weight: .heavy)).padding(.bottom, 4).multilineTextAlignment(.leading)
                Text("$\(price)").foregroundColor(.white).font(.system(size: 20, weight: .semibold)).padding(.bottom, 12)
            }
            
        }
    }
}
struct ModalBase<Content: View>: View {
    
    @Binding var showModal: Bool
    let content: Content
    
    init(@ViewBuilder content: () -> Content, showModal: Binding<Bool>) {
        self.content = content()
        self._showModal = showModal
    }
    
    var body: some View {
        ZStack {
            HStack {
                VStack {
                    if showModal {
                        self.content
                    }
                }
            }
        }
        .background(Color.white)
        .offset(x: 0, y: showModal ? 0 : UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.safeAreaInsets.top ?? 0 )
    }
}
struct ModalView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.white)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.white)]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        print("halo")
    }
    var filteredBy:[String] =  ["Newest","Oldest", "Most Downloaded", "Rating", "Matches"]
    var platformList:[String] =  ["Playstation","Xbox", "Nintento NES", "Sega", "Atari" , "PSP","Nintendo WII", "Nintento Switch", "PS Vita", "Steam Deck", "PC","Android", "iOS", "MacOS", "LinuxOS"]
    var priceList:[String] =  ["Cheapest", "Most Expensive", "Rp. 100.000 - 150.000" , "150.000 - 450.000", ">450.000"]

    
    @State var selectionsPlatform: [String] = []
    @State var selectionsfilteredBy:String? = nil
    @State var selectionsPriceList:String? = nil
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        NavigationStack {
            VStack{
                List{
                    Section {
                        ForEach(filteredBy, id: \.self) { item in
                           SelectedRowFilter(title: item, selectedItems: $selectionsfilteredBy)
                        }.listRowBackground(Color(.clear)) .listRowSeparatorTint(Color(.white)).listRowInsets(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                    } header: {
                        Text("Sort By")
                            .textCase(.uppercase)
                        
                    }.headerProminence(.standard)
                    
                    Section {
                        ForEach(priceList, id: \.self) { item in
                           SelectedRowFilter(title: item, selectedItems: $selectionsPriceList)
                        }.listRowBackground(Color(.clear)) .listRowSeparatorTint(Color(.white)).listRowInsets(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                    } header: {
                        Text("Sort By")
                            .textCase(.uppercase)
                        
                    }.headerProminence(.standard)
                    
                    Section {
                        ForEach(self.platformList, id: \.self) { item in
                            MultipleSelectionRowPlatform(title: item, isSelected: self.selectionsPlatform.contains(item)) {
                                if self.selectionsPlatform.contains(item) {
                                    self.selectionsPlatform.removeAll(where: { $0 == item })
                                }
                                else {
                                    self.selectionsPlatform.append(item)
                                }
                            }.listRowBackground(Color("CustomColorSecond"))
                        } .listRowSeparatorTint(Color(.white)).listRowInsets(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                    } header: {
                        Text("Platforms")
                            .textCase(.uppercase)
                        
                    }.headerProminence(.standard)
                }.scrollContentBackground(.hidden).foregroundColor(.white)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)      // << here !!
                .background(Color("CustomColorSecond").edgesIgnoringSafeArea(.all))
            
              
            
            
            .navigationTitle("Filter").navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button("Cancel",
                                                action: {
                presentationMode.wrappedValue.dismiss()
            }).foregroundColor(Color(.magenta)))
            .navigationBarItems(trailing: Button("Confirm",
                                                action: {
                presentationMode.wrappedValue.dismiss()
            }).foregroundColor(Color(.magenta)) )
        }

        
    }
}



//struct ChildView : View {
//    @Environment(\.isSearching) var isSearching
//
//    var body: some View {
//        EmptyView()
//            .onChange(of: isSearching) { newValue in
//                if !newValue {
//                    print("Searching cancelled")
//                }
//            }
//    }
//}


struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage(isPresented: .constant(true))
    }
}
