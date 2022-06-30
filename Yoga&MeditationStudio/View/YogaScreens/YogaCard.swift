//
//  YogaCard.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 09/06/22.
//

import SwiftUI

struct YogaCard: View {
    
    @State var yogaPose: YogaPose
    @State var data: CardDetails
        
    var body: some View {
      
        NavigationLink(destination: YogaPoseLottieScreen(yogaPose: yogaPose)) {
            
            VStack {
             
                Image("\(data.image)")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: .center)
                
                VStack(alignment:.leading) {
                    
                    Text("\(yogaPose.rawValue)")
                        .font(.system(size: 14, weight: .medium))
                    
                    HStack {
                        Image(systemName: "staroflife")
                        Text("Body-Flexibility")
                    }
                    .font(.system(size: 8, weight: .regular))
                    .foregroundColor(.black).opacity(0.6)
                    
                    HStack {
                        Image(systemName: "timer")
                        Text("30 sec ")
                    }
                    .font(.system(size: 8, weight: .regular))
                    .foregroundColor(.black).opacity(0.6)
                }
                
            }
            .frame(width: 150, height: 170, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.all, 6)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.3), radius: 4, x: 4, y: 4)
                .shadow(color: .white.opacity(0.5), radius: 6, x: -6, y: -6)
        }
        
    }
}


struct YogaCard_Previews: PreviewProvider {
    static var previews: some View {
        YogaCard(yogaPose: .treePose, data: .init(title: .treePose, image: "",  id: 0))
    }
}
    
