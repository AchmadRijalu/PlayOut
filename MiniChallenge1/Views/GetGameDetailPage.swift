//
//  GetGameDetailPage.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 03/04/23.
//

import SwiftUI
import WebKit


struct GetGameDetailPage: View {
    
    @State var index = 0
    let ID:String
    let gamePlayID:String
    
    var body: some View {
        ScrollView{
            VStack{
                Video(videoID: ID).frame(width: .infinity, height: .infinity ).cornerRadius(12)

            }.frame(width: 400, height: 350, alignment: .bottom).background(
                Image("re4")
                    .resizable()
            )
            HStack{
                HStack{
                    Image(systemName: "dollarsign.circle").font(.system(size: 40)).foregroundColor(.white)
                    Text("Price Rp. 499.000").font(.system(size: 15, weight: .semibold)).border(Color("CustomColorSecond")).padding(8).foregroundColor(.white).background(Color("CustomColorSecond")).cornerRadius(8)
                }.padding(.leading, 12)
                Spacer()
                HStack{
                    Image(systemName: "link.circle.fill").font(.system(size: 40)).foregroundColor(.white)
                    Text("70% Match").font(.system(size: 15, weight: .semibold)).border(Color("CustomColorSecond")).padding(8).foregroundColor(.white).background(Color("CustomColorSecond")).cornerRadius(8)
                }.padding(.trailing, 12)
              
            }
            HStack{
                Text("Resident Evil 4 Remake").foregroundColor(.white).font(.system(size: 30, weight: .bold))
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 26, bottom: 8, trailing: 12))
            VStack{
                HStack(spacing: 0){
                    Text("Overview").foregroundColor(self.index == 0 ? .white : Color(.white).opacity(0.7 )).fontWeight(.bold).padding(.vertical, 10).padding(.horizontal, 30).background(self.index == 0 ? Color(.magenta) : Color("CustomColor")).cornerRadius(5).onTapGesture {
                        withAnimation(.default){
                            self.index = 0
                        }
                        
                    }
                    Text("Details").foregroundColor(self.index == 1 ? .white : Color(.white).opacity(0.7 )).fontWeight(.bold).padding(.vertical, 10).padding(.horizontal, 35).background(self.index == 1 ? Color(.magenta) : Color("CustomColor")).cornerRadius(5).onTapGesture {
                        withAnimation(.default){
                            self.index = 1
                        }
                       
                    }
                }
                HStack{
                    Spacer()
                    Text("Downloaded")
                    Spacer()
                    Text("Rating").padding(.trailing, 12)
                    Spacer()
        
                }.foregroundColor(.white).font(.system(size: 16, weight: .semibold)).padding(.bottom, 4)
                HStack{
                    Spacer()
                    HStack{
                        Image(systemName: "square.and.arrow.down").padding(0)
                        Text("3.7M")
                    }
                    Spacer()
                    HStack{
                        Image(systemName: "star.fill").padding(0)
                        Text("3.7M")
                    }
                    Spacer()
                }.foregroundColor(.white).font(.system(size: 16, weight: .semibold)).padding(.bottom, 28)
                
                TabView(selection: self.$index){
                    
                    OverviewPage().tag(0)
                    DetailsPage().tag(1)
                   
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode:.never))

            }.padding().frame(minWidth: 300, idealWidth: 400, minHeight: 100, idealHeight: self.index == 0 ? 700 : 400, maxHeight: 500, alignment: .top).background(Color("CustomColorSecond")).cornerRadius(24
            ).padding(.horizontal, 16).shadow(color: .purple, radius: 10, x: 1, y: 14)
            HStack{
                Spacer()
                Image("leonright").resizable().frame(width: 300, height: 300)
                
            }.padding(.horizontal, 16)
            
            HStack{
                Text("Gameplay").foregroundColor(.white).font(.system(size: 24, weight: .bold))
                Spacer()
            }.padding(EdgeInsets(top: 12, leading: 26, bottom: 12, trailing: 12))
            
            VStack{
                Video(videoID: gamePlayID).padding().frame(width: .infinity, height: 340 )

            }.frame(width: 400, height: 350)
        }.background(Color("CustomColor"))
           
    }
}



struct Video: UIViewRepresentable{
    let videoID:String

    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: UIViewType, context: Context){
        guard let YoutubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")else{return}

        uiView.scrollView
        uiView.load(URLRequest(url: YoutubeURL))
    }

}

struct GetGameDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        GetGameDetailPage(ID: "", gamePlayID: "")
   
    }
}
