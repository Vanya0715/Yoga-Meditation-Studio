//
//  PlayerView.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 14/06/22.
//

import SwiftUI
import AVKit
import Lottie

struct PlayerView: View {
    
    @State var data : Data = .init(count: 0)
    @State var player : AVAudioPlayer!
    @State var playing = false
    @State var width : CGFloat = 0
    @State var songs = [""]
    @State var current = 0
    @State var finish = false
    @State var track = [""]
    @State var lottie = ["m1","m2","m3","m4","m5"]

    
    
    var body: some View {
     
            VStack {
                VStack(spacing: 20) {
                    
                    LottieView(fileName: self.lottie[self.current] , isPlaying: true)
                        .clipShape(Circle())
                        .padding(.all, 8)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.3), radius: 8, x: 8, y: 8)
                        .shadow(color: .white.opacity(0.5), radius: 10, x: -10, y: -10)
                        .frame(width: 300, height: 350, alignment: .center)
                   
                    VStack {
                        Text(self.track[self.current])
                            .font(.system(size: 30, weight: .bold, design: .serif))
                            .foregroundColor(Color("B"))
                        Text("Sit back and relax")
                            .font(.system(size: 18, weight: .bold, design: .serif))
                            .foregroundColor(Color("B")).opacity(0.6)
                    }
                    VStack {
                        ZStack(alignment: .leading) {
                            
                            Capsule().fill(Color.black.opacity(0.08)).frame(height: 8)
                            
                            Capsule().fill(Color.red).frame(width: self.width, height: 8)
                                .gesture(DragGesture()
                                            .onChanged({ (value) in
                                    
                                    let x = value.location.x
                                    
                                    self.width = x
                                    
                                }).onEnded({ (value) in
                                    
                                    let x = value.location.x
                                    
                                    let screen = UIScreen.main.bounds.width - 30
                                    
                                    let percent = x / screen
                                    
                                    self.player.currentTime = Double(percent) * self.player.duration
                                }))
                        }.padding()
                        HStack(spacing:30)    {
                            Button(action: {
                                
                                if self.current > 0{
                                    
                                    self.current -= 1
                                    
                                    self.ChangeSongs()
                                }
                                
                            }) {
                                
                                Image(systemName: "backward.fill").font(.title)
                                
                            }
                            
                            Button(action: {
                                
                                self.player.currentTime -= 15
                                
                            }) {
                                
                                Image(systemName: "gobackward.15").font(.title)
                                
                            }
                            ButtonView(systemName:  self.playing && !self.finish ? "pause.fill" : "play.fill") {
                                if self.player.isPlaying{
                                    
                                    self.player.pause()
                                    self.playing = false
                                }
                                else{
                                    
                                    if self.finish{
                                        
                                        self.player.currentTime = 0
                                        self.width = 0
                                        self.finish = false
                                        
                                    }
                                    
                                    self.player.play()
                                    self.playing = true
                            }
                            }

                            
                            Button(action: {
                                
                                let increase = self.player.currentTime + 15
                                
                                if increase < self.player.duration{
                                    
                                    self.player.currentTime = increase
                                }
                                
                            }) {
                                
                                Image(systemName: "goforward.15").font(.title)
                                
                            }
                            
                            Button(action: {
                                
                                if self.songs.count - 1 != self.current{
                                    
                                    self.current += 1
                                    
                                    self.ChangeSongs()
                                }
                                
                            }) {
                                
                                Image(systemName: "forward.fill").font(.title)
                                
                            }
                            
                        }
                        .foregroundColor(Color("B"))
                        .padding()
                    }
                    
                }
                .frame(width: 330, height: 670, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.all, 8)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(color: .black.opacity(0.3), radius: 8, x: 8, y: 8)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: -10, y: -10)
            
            }
        
        .navigationBarHidden(true)
        .onAppear {
            let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")
            
            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            self.player.prepareToPlay()
      
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                
                if self.player.isPlaying{
                    
                    let screen = UIScreen.main.bounds.width - 30
                    
                    let value = self.player.currentTime / self.player.duration
                    
                    self.width = screen * CGFloat(value)
                }
            }
        }
    }

    
    func ChangeSongs(){
        
        let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        self.data = .init(count: 0)
        self.player.prepareToPlay()
        self.playing = true
        self.finish = false
        self.width = 0
        self.player.play()
        
    }
    
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
