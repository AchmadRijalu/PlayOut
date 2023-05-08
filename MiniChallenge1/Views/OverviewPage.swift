//
//  OverviewPage.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 04/04/23.
//

import SwiftUI

struct OverviewPage: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Horror").foregroundColor(.white  ).fontWeight(.bold).padding(.vertical, 10).padding(.horizontal, 15).background(.clear ).cornerRadius(10).overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.magenta), lineWidth: 5)
                ).padding(.trailing, 11)
                
                
                Text("Action").foregroundColor(.white  ).fontWeight(.bold).padding(.vertical, 10).padding(.horizontal, 15).background(.clear ).cornerRadius(10).overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.magenta), lineWidth: 5)
                ).padding(.trailing, 11)
                Text("RPG").foregroundColor(.white  ).fontWeight(.bold).padding(.vertical, 10).padding(.horizontal, 15).background(.clear ).cornerRadius(10).overlay( /// apply a rounded border
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.magenta), lineWidth: 5)
                ).padding(.trailing, 11)
                Spacer()
                
            }.padding(.bottom, 21)
            
            Text("Description").font(.system(size: 23, weight: .semibold)).foregroundColor(.white).padding(.bottom, 12)
            Text("Resident Evil 4 (2023) is a remake of the 2005 game Resident Evil 4. It features third-person shooter gameplay similar to the original, while drawing from the remakes of Resident Evil 2 (2019) and Resident Evil 3 (2020). Resident Evil 4 features redesigned visuals, designed to create a tenser atmosphere, along with new character designs and backgrounds. It offers six control schemes, including one styled after the original game. Occasionally the player must solve puzzles. In some sequences, Leon must protect the president's daughter, Ashley. She uses a simpler health system than in the original, and can be instructed to stay close or far").font(.system(size: 16, weight: .medium)).foregroundColor(.white).padding(.bottom, 20)
            
            Text("Synopsis").font(.system(size: 23, weight: .semibold)).foregroundColor(.white).padding(.bottom, 12)
            Text("Leon rescues Ashley, who is also infected with a Plagas, but they are pursued by Méndez until Leon eventually kills him. With their rescue helicopter delayed by inclement weather, the pair retreat to a castle. However, the lord Ramón Salazar's (Marcio Moreno) forces capture Ashley. Leon briefly re-encounters Ada following their last encounter in Raccoon City before reuniting with Luis, who provides suppressants for the Plagas and reveals he wants to atone for his actions while working as an Umbrella researcher. ").font(.system(size: 16, weight: .medium)).foregroundColor(.white).padding(.bottom, 20)
            
            Spacer()
            
        }
//        .background(.blue)
    }
}

struct OverviewPage_Previews: PreviewProvider {
    static var previews: some View {
        OverviewPage()
    }
}
