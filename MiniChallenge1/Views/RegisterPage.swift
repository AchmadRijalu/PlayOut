//
//  RegisterPage.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 05/04/23.
//

import SwiftUI


struct RegisterPage: View {
    
    @State var email: String = ""
    @State var username: String = ""
    @State var passwordconfirm: String = ""
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(.white)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.white)]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        print("halo")
    }
    
    @State var password: String = ""
    @State var onBoarding:Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    VStack(alignment: .leading , spacing: 12){
                        Text("Sign up to Get Your Personalized").foregroundColor(Color.white.opacity(0.5))
                    }
                    Spacer()
                }
                Spacer()
                HStack{
                    Image(systemName: "envelope").foregroundColor(.white).font(.title2)
                    TextField("Enter Email", text: $email).foregroundColor(.gray).padding()
                        .background(Color.white.opacity(0.8)).foregroundColor(.white).fontWeight(.semibold).cornerRadius(12).padding(.all).keyboardType(.emailAddress)
                }
                HStack{
                    Image(systemName: "person").foregroundColor(.white).font(.title2)
                    TextField("Enter Username.", text: $username).padding()
                        .background(Color.white.opacity(0.8)).foregroundColor(.gray).fontWeight(.semibold).cornerRadius(12).padding(.all).keyboardType(.emailAddress)
                }
                HStack{
                    Image(systemName: "lock").foregroundColor(.white).font(.title2)
                    TextField("Enter Password", text: $password).padding()
                        .background(Color.white.opacity(0.8)).foregroundColor(.gray).fontWeight(.semibold).cornerRadius(12).padding(.all).keyboardType(.emailAddress)
                }
                HStack{
                    Image(systemName: "lock").foregroundColor(.white).font(.title2)
                    TextField("Confirm Password", text: $passwordconfirm).padding()
                        .background(Color.white.opacity(0.8)).foregroundColor(.gray).fontWeight(.semibold).cornerRadius(12).padding(.all)
                }
                NavigationLink(destination: OnBoarding(), isActive: $onBoarding){
                    Button(action: {
                        onBoarding = true
                    }, label: {
                        Text("Next").fontWeight(.heavy).foregroundColor(.white).padding(.vertical).frame(width: UIScreen.main.bounds.width - 150).background(Color(.magenta)).clipShape(Capsule())
                    }).padding(.top)
                }
                
                
                Spacer()
                
                
            }.accentColor(Color(.magenta)).padding(.all).frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("CustomColor"))
                .navigationTitle("Sign up").navigationBarTitleDisplayMode(.large)
        }
        
    }
}

struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}

