//
//  OnBoarding.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 04/04/23.
//

import SwiftUI

struct OnBoarding: View {
    
    var items:[String] =  ["Action","Fighting", "Sports", "Sandbox", "Real Time Strategy", "FPS", "Multiplayer Online Battle Arena", "RPG", "Action Adventure", "Platformer", "MMORPG", "Horror", "Action RPG", "Single Player"]
    @State var selections: [String] = []
    //    @State var selectedRows = Set<String>()
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.white)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.white)]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        print("halo")
    }
    var body: some View {
        NavigationStack{
            VStack{
                List {
                    ForEach(self.items, id: \.self) { item in
                        MultipleSelectionRow(title: item, isSelected: self.selections.contains(item)) {
                            if self.selections.contains(item) {
                                self.selections.removeAll(where: { $0 == item })
                            }
                            else {
                                self.selections.append(item)
                            }
                        }.listRowBackground(Color("CustomColorSecond"))
                    } .listRowSeparatorTint(Color(.white)).listRowInsets(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
                }.scrollContentBackground(.hidden)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity).foregroundColor(Color(.white)).background(Color("CustomColor"))
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: OnBoardingPlatform()){
                            Text("Next").foregroundColor(Color(.magenta))
                        }
                        
                    }
                }
                .navigationTitle("Choose Your Genre").navigationBarTitleDisplayMode(.inline)
            
            
        }.accentColor(Color(.magenta)).padding(.all).frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("CustomColor"))
    }
    
}
struct MultipleSelectionRow: View {
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
struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
