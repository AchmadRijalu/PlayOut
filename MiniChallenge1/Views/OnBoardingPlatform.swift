//
//  OnBoardingPlatform.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 06/04/23.
//

import SwiftUI

struct OnBoardingPlatform: View {
    @State var signIn:Bool = false
    var platformList1:[String] =  ["Playstation","Xbox", "Nintento NES", "Sega", "Atari"]
    var platformList2:[String] =  ["PSP","Nintendo WII", "Nintento Switch", "PS Vita", "Steam Deck"]
    
    var platformList3:[String] =  ["PC","Android", "iOS", "MacOS", "LinuxOS"]
    
    @State var selectionsPlatform: [String] = []
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Spacer()
                
                List {
                    Section {
                        ForEach(self.platformList1, id: \.self) { item in
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
                        Text("Consoles")
                            .textCase(.uppercase)
                        
                    }.headerProminence(.standard)
                    Section {
                        ForEach(self.platformList2, id: \.self) { item in
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
                        Text("Portable Consoles")
                            .textCase(.uppercase)
                        
                    }.headerProminence(.standard)
                    
                    Section {
                        ForEach(self.platformList3, id: \.self) { item in
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
                        Text("Personal Devices")
                            .textCase(.uppercase)
                        
                    }.headerProminence(.standard)
                    
                }.scrollContentBackground(.hidden)
                NavigationLink(destination: Beranda(), isActive:$signIn){
                    Button(action: {
                        signIn = true
                    }, label: {
                        Text("Let's Get Started").fontWeight(.heavy).foregroundColor(.white).padding(.vertical).frame(width: UIScreen.main.bounds.width - 150).background(Color(.magenta)).clipShape(Capsule()).padding(.all)
                    })
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity).foregroundColor(Color(.white)).background(Color("CustomColor"))
                .navigationTitle("Platform").navigationBarTitleDisplayMode(.inline)
        }
    }
}
struct MultipleSelectionRowPlatform: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
struct OnBoardingPlatform_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPlatform()
    }
}
