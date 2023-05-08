//
//  LoginPage.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 04/04/23.
//

import SwiftUI

struct LoginPage: View {
    @State var email: String = ""
    @State var password: String = ""
    
    @State var signUp:Bool = false
    @State var signIn:Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Image("plbasiclogo").resizable().aspectRatio(contentMode: .fit).frame(width: 100).shadow(color: Color(.magenta), radius: 20, x: 1, y: 5)
                Spacer()
                HStack{
                    VStack(alignment: .leading , spacing: 12){
                        Text("Login").font(.title).fontWeight(.bold).foregroundColor(.white)
                        Text("Sign in to Continue").foregroundColor(Color.white.opacity(0.5))
                    }
                    Spacer()
                }
                HStack{
                    Image(systemName: "envelope").foregroundColor(.white).font(.title2)
                    TextField("Enter Email...", text: $email).padding()
                        .background(Color.white.opacity(0.8)).foregroundColor(.white).fontWeight(.semibold).cornerRadius(12).padding(.all).keyboardType(.emailAddress)
                }
                HStack{
                    Image(systemName: "lock").foregroundColor(.white).font(.title2)
                    TextField("Enter Email...", text: $password).padding()
                        .background(Color.white.opacity(0.8)).foregroundColor(.white).fontWeight(.semibold).cornerRadius(12).padding(.all)
                }
                NavigationLink(destination: Beranda(), isActive:$signIn){
                    Button(action: {
                        signIn = true
                    }, label: {
                        Text("Sign in").fontWeight(.heavy).foregroundColor(.white).padding(.vertical).frame(width: UIScreen.main.bounds.width - 150).background(Color(.magenta)).clipShape(Capsule())
                    }).padding(.top)
                }
                
                Spacer()
                
                HStack{
                    Text("Don't have an account?").foregroundColor(Color.white.opacity(0.5))
                    
                    NavigationLink(destination: RegisterPage(), isActive: $signUp){
                        Button(action: {
                            signUp = true
                        }, label: {
                            Text("Sign up").fontWeight(.heavy).foregroundColor(Color(.magenta).opacity(0.7))
                        })
                    }
                    
                }
            }.padding(.all).frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("CustomColor"))
                .navigationTitle("Sign in").toolbar(.hidden)
        }.accentColor(Color(.magenta)).ignoresSafeArea(.all, edges: .all)
        
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
