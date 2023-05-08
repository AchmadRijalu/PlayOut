//
//  ProfilePage.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 06/04/23.
//

import SwiftUI

struct ProfilePage: View {
    @Binding var darkModeEnabled:Bool
    @Binding var systemThemeEnabled:Bool
    
    @State private var ison = false
    @State private var isexit = false
    @State private var about = false
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading){
                VStack{
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "person.fill")
                            Spacer()
                            VStack(alignment: .leading){
                                Text("Arya Sattang").foregroundColor(.black).fontWeight(.semibold)
                                
                                Text("wedhus.gembs@Yahoo.com").foregroundColor(.black).fontWeight(.semibold)
                            }
                            
                            Spacer()
                            
                        }.foregroundColor(.black).padding(12).background(.white).cornerRadius(10).shadow(color: Color(.magenta), radius: 8, x: 0, y: 6)
                    }.padding(.bottom , 27)
                    
                    VStack(alignment: .leading, spacing: 15){
                        Text("Others").foregroundColor(.white).fontWeight(.heavy)
                        NavigationLink(destination: FavoritePage()){
                            HStack{
                                Image(systemName: "heart.fill")
                                Text("Favorites").foregroundColor(.black)
                                Spacer()
                                Text("6 Items").bold()
                            }.foregroundColor(.black).padding(20).background(.white).cornerRadius(10).shadow(color: .black, radius: 0.6, x: 0, y: 2)
                        }
                        
                        Button(action: {
                            about.toggle()
                        }) {
                            HStack {
                                Image(systemName: "gear.circle")
                                Text("Recommendations").foregroundColor(.black).frame(height: 24).frame(maxWidth: .infinity , alignment: .leading).font(.headline)
                            }
                        }.alert("Coming Soon", isPresented: $about){
                            Button("Okay", role: .cancel){
                                
                            }
                        }.foregroundColor(.black).frame(height: 24).frame(maxWidth: .infinity , alignment: .leading).padding( 20).foregroundColor(.white).cornerRadius(10).background(.white).cornerRadius(10).shadow(color: .black, radius: 0.6, x: 0, y: 2)
                        
                        
                        
                        Button(action: {
                            if let url = URL(string: "https://achmadrijalu.github.io/Jaloouu") {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            HStack {
                                Image(systemName: "phone.fill")
                                Text("Contact Us").foregroundColor(.black).frame(height: 24).frame(maxWidth: .infinity , alignment: .leading)
                            }
                        }.foregroundColor(.black).frame(height: 24).frame(maxWidth: .infinity , alignment: .leading).padding( 20).foregroundColor(.white).cornerRadius(10).background(.white).cornerRadius(10).shadow(color: .black, radius: 0.6, x: 0, y: 2)
                        
                    }.padding(1)
                }
                
                Spacer()
                VStack{
                    
                    Button(action: {
                        isexit.toggle()
                    }) {
                        HStack {
                            Text("Sign out").foregroundColor(.white).frame(height: 24).frame(maxWidth: .infinity , alignment: .leading).font(.headline)
                            Spacer()
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                    }.alert("Exit this apps?", isPresented: $isexit){
                        Button("Exit", role: .destructive){
                            exit(0)
                        }
                        Button("Cancel", role: .cancel){
                        }
                        
                        
                    }.foregroundColor(.white).frame(height: 24).frame(maxWidth: .infinity , alignment: .leading).padding( 20).foregroundColor(.white).cornerRadius(10).background(.pink).cornerRadius(10).shadow(color: .black, radius: 0.6, x: 0, y: 2)
                    
                }
                
            }.padding(36).background(Color("CustomColor"))
        }.accentColor(Color(.magenta))
            .navigationTitle("Profile")
        
    }
    
    
    struct ProfilePage_Previews: PreviewProvider {
        static var previews: some View {
            ProfilePage(darkModeEnabled: .constant(false), systemThemeEnabled: .constant(false))
        }
    }
}
