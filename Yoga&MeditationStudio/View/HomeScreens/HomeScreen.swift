//
//  HomeScreen.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 01/06/22.
//

import SwiftUI

struct HomeScreen: View {
    
  
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.green.opacity(0.3), .teal.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                WelcomeView().offset(y: 20)
                CalenderView(calendar: Calendar(identifier: .gregorian)).offset(y: -15)
                ActivityView().padding(.bottom, 30)
            }
            
        
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
    
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
           
    }
}
