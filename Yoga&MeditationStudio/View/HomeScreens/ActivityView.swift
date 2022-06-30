//
//  ActivityView.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 06/06/22.
//

import SwiftUI


enum Activity: String {
    case Yoga = "Yoga"
    case Meditation = "Mediataion"
    case Relax = "Relax"
}

struct TypeView: View {
    @State var text: Activity
    
    var body: some View {
        VStack(spacing:20) {
                RoundedRectangle(cornerRadius: 30)
                    .fill(.white).opacity(0.55)
                    .frame(width: 350, height: 100, alignment: .center)
                    
                    .overlay(
                        HStack {
                            Image("\(text)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .offset(x: -10, y: -10 )
                                .shadow(color: .black, radius: 3, x: 0, y: 3)
                                .frame(width: 80, height: 80)
                                .padding(.leading)
    
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("\(text.rawValue)")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                Text("Improve your health, boost your brain and thinking skills")
                                    .font(.caption)
                                    .foregroundColor(.black.opacity(0.8))
                                    .multilineTextAlignment(.leading)
                            }.padding()
                           
                        }
                    )
                
            
        }.padding(.horizontal)
    }
}
struct ActivityView: View {
    
    var body: some View {
       
        VStack(spacing: 20) {
            NavigationLink(destination: YogaScreen()) {
                TypeView(text: .Yoga)
            }
            NavigationLink(destination: MeditationScreen()) {
                    VStack(spacing:20) {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.white).opacity(0.55)
                                .frame(width: 350, height: 100, alignment: .center)
                                .overlay(
                                    HStack {
                                
                                        VStack(alignment: .trailing, spacing: 8) {
                                            Text("Meditation")
                                                .font(.title2)
                                                .foregroundColor(.black)
                                            Text("Improve your health, boost your thinking skills and calm your mind.")
                                                .font(.caption)
                                                .foregroundColor(.black.opacity(0.8))
                                                
                                                .multilineTextAlignment(.leading)
                                        }.padding()
                                        Image("Meditation")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .offset(x: -10, y: -10 )
                                            .shadow(color: .black, radius: 3, x: 0, y: 3)
                                            .frame(width: 80, height: 80)
                                            .padding(.leading)
                                       
                                    }
                                )
                            
                        
                    }.padding(.horizontal)
                }
                
                NavigationLink(destination: BreatheScreen()) {
                    TypeView(text: .Relax)
                }
            
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
  
    static var previews: some View {
        NavigationView {
            ActivityView()
                
        }
       
    }
}
