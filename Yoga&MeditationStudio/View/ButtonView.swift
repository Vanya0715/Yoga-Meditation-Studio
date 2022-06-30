//
//  ButtonView.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 10/06/22.
//

import SwiftUI

struct ButtonView: View {
    
    var systemName: String = "play"
    var fontsize: CGFloat = 18
    var color: Color  = Color("B")
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .font(.system(size: fontsize, weight: .bold))
                .foregroundColor(Color("B"))
                .padding(.all,12)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
                .shadow(color: .gray.opacity(0.6), radius: 4, x: 4, y: 4)
                .shadow(color: .white.opacity(0.5), radius: 4, x: -4, y: -4)
                
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(action: {})
    }
}
