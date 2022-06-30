//
//  WelcomeView.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 06/06/22.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {

            VStack(alignment:.leading) {
             
                Text(" Namaste🙏🏻🙏🏻")
                    .font(.system(size: 20, weight: .medium, design: .serif))
                Text(" How are you feeling today?")
                    .font(.system(size: 15, weight: .light, design: .serif))
                
                Image("Home")
                    .resizable()
                    .shadow(color: .black.opacity(0.3), radius: 7, x: 7, y: 7)
                    .shadow(color: .white.opacity(0.2), radius: 5, x: -5, y: -5)
                    .frame(width: 300, height: 150, alignment: .center)
                    .scaledToFill()
                    .padding(.top)
            }
               
        
}
}


struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
