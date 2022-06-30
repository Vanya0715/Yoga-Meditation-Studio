//
//  LaunchScreen.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 01/06/22.
//

import SwiftUI

struct LaunchScreen: View {
    
    
    
    var body: some View {
        NavigationView {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.green.opacity(0.3), .teal.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center,spacing: 45) {
                Spacer()
                
                Image("Launch")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 300, alignment: .center)
                    .padding(.bottom, 40)
            
                VStack(alignment:.leading, spacing: 8) {
                    Text("Say Hi, To Your Self Care Journal")
                        .font(.system(size: 25, weight: .bold, design: .serif))
                        .foregroundColor(Color("B"))
                    Text("Feel Better | Sleep Better | Live Better")
                        .foregroundColor(Color("B")).opacity(0.8)
                    
                }
                 .frame(width: 300, height: 100)
                 .padding(.vertical, 30)
            
                NavigationLink(destination: HomeScreen()) {
                       
                       Text("Get Started !!")
                        .font(.system(size: 20, weight: .medium, design: .serif))
                    
                        .foregroundColor(Color("B"))
                        .frame(width: 300, height: 50, alignment: .center)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .padding(.all, 6)
                                        .background(.ultraThinMaterial)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .shadow(color: .black.opacity(0.3), radius: 8, x: 8, y: 8)
                                        .shadow(color: .white.opacity(0.2), radius: 8, x: -10, y: -10)
                
                                    
                }
                Spacer()
            }.padding()
        }
        }
        .navigationBarHidden(true)
        
       
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    
    static var previews: some View {
    
        LaunchScreen()
        
     
    }
}
