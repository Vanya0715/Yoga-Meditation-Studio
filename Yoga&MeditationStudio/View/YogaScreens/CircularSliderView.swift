//
//  CircularSliderView.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 08/06/22.
//

import SwiftUI

let defaultTimeRemaining: CGFloat = 30
let lineWidth: CGFloat = 10
let radius: CGFloat = 160



struct CircularSliderView: View {
    @State var data: YogaPose
   @State private var lottiePlay = false
    @State private var isActive = false
    @State private var timeRemaining: CGFloat = defaultTimeRemaining
 
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
     
   
        VStack(spacing: 25 ){
            NavBar(title: "You Got This")
            Spacer()
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                Circle()
                    .trim(from: 0, to: 1 - ((defaultTimeRemaining - timeRemaining) / defaultTimeRemaining))
                    .stroke( timeRemaining > 20 ? Color("B") : timeRemaining > 10 ? Color("G") : Color("R"),
                             style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: 0.5)
                                
                LottieView(fileName: "\(data)", isPlaying: true)
                
            }.clipShape(Circle())
                .padding(.all, 8)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.3), radius: 8, x: 8, y: 8)
                .shadow(color: .white.opacity(0.5), radius: 10, x: -10, y: -10)
            .frame(width: radius * 2, height: radius * 2)

// MARK: - Workout Info
            Spacer()
            Divider()
            VStack(spacing: 20) {
            VStack(alignment: .leading,spacing: 10) {
                Text("\(data.rawValue)")
                    .font(.title)
                    .fontWeight(.medium)
                HStack(spacing: 10) {
                    Image(systemName: "staroflife")
                    Text("Body-Flexibility")
                    Spacer()
                    Image(systemName: "timer")
                    Text("30 sec ")
                }
                HStack{
                    Image(systemName: "backward.fill")
                    Text("Press reset to do more reps")
                }
               
            }.padding(.trailing, 90)
   
            HStack(spacing: 50) {
                ButtonView(systemName:"backward.fill") {
                    timeRemaining = defaultTimeRemaining
                }
                
                Text("\(Int(timeRemaining))")
                    .font(.system(size: 40, weight: .bold))
                    .padding()
                    .foregroundColor(timeRemaining > 20 ? Color("B") : timeRemaining > 10 ? Color("G") : Color("R"))
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
                    .shadow(color: .gray.opacity(0.6), radius: 5, x: 5, y: 5)
                    .shadow(color: .white.opacity(0.5), radius: 5, x: -5, y: -5)
                
                ButtonView(systemName: ("\(isActive ? "pause.fill" : "play.fill")")) {
                    isActive.toggle()
                }
                
            }.padding()
            }
        }
        .padding()
        .onReceive(timer) {  _ in
            guard isActive
            
            else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1

              
            } else {
                isActive = false
            
                timeRemaining = defaultTimeRemaining
            }
        }.navigationBarHidden(true)
    }
    func playLottie() -> Bool {
        if isActive {
            return true
        }
        else {
            return false
        }
    }
}

struct CircularSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CircularSliderView(data: .treePose)
    }
}


