//
//  MeditationScreen.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 10/06/22.
//

import SwiftUI
import Lottie


struct MeditationScreen: View {
    
    @State var songs = ["Medi1","Medi2", "Medi3", "Medi4", "Medi5"]
    @State var track = ["Track 1", "Track 2", "Track 3", "Track 4", "Track 5"]
 
 
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green.opacity(0.3), .teal.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack {
                NavBar(title: "Stay Calm ")
                Spacer()
                PlayerView(songs: songs, track: track)
               Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct MeditationScreen_Previews: PreviewProvider {
    static var previews: some View {
        MeditationScreen()
    }
}
