//
//  NavBar.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 09/06/22.
//

import SwiftUI

struct NavBar: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var title: String
    
    var body: some View {
     
        HStack(spacing: 40) {
            ButtonView(systemName: "arrow.left"){
                self.presentationMode.wrappedValue.dismiss()
            }
  
            Text("\(title)")
                .font(.title)
                .foregroundColor(Color("B"))
                .fontWeight(.bold)
            Spacer()
        }.padding(.horizontal, 8)
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar( title: "")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
