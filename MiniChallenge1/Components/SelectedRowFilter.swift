//
//  SelectedRowFilter.swift
//  MiniChallenge1
//
//  Created by Achmad Rijalu on 07/04/23.
//

import SwiftUI

struct SelectedRowFilter: View {
    
    let title:String
    @Binding var selectedItems:String?
    var body: some View {
        HStack{
            Text(title)
            Spacer()
            if title == selectedItems{
                Image(systemName: "checkmark").foregroundColor(Color(.magenta))
            }
        }.contentShape(Rectangle()).onTapGesture {
            self.selectedItems = self.title
        }
    }
}

struct SelectedRowFilter_Previews: PreviewProvider {
    static var previews: some View {
        SelectedRowFilter(title: "", selectedItems: .constant(""))
    }
}
