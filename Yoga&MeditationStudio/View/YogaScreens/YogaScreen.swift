//
//  YogaScreen.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 01/06/22.
//

import SwiftUI

struct YogaScreen: View {
    var body: some View {
    
       
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.green.opacity(0.3), .teal.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            
                VStack(spacing: 30) {
                    NavBar(title: "Let's Get started")
                    YogaScrollView()
                    Spacer()
                }
                .foregroundColor(.black)
               
            }
            .navigationTitle("Lets Get started")
            .navigationBarHidden(true)
    }
}

struct YogaScreen_Previews: PreviewProvider {
    static var previews: some View {
        YogaScreen()
    }
}
