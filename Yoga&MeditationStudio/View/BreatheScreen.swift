//
//  BreatheScreen.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 01/06/22.
//

import SwiftUI

struct BreatheScreen: View {
    
    @State var songs = ["relaxation"]
    @State var current = 0
    @State var track = ["Breathe In & Out"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green.opacity(0.3), .teal.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
             
                NavBar(title: "Relax")
                Spacer()
                PlayerView(songs: songs, track: track, lottie: ["yoga"])
                Spacer()
            }
        }
    }
}

struct BreatheScreen_Previews: PreviewProvider {
    static var previews: some View {
        BreatheScreen()
    }
}
