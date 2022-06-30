//
//  YogaScrollView.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 07/06/22.
//

import SwiftUI


struct YogaScrollView: View {
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var data: [CardDetails] = [
        .init(title: .balancing, image: "balancing",  id: 0),
        .init(title: .catCow, image: "catCow",  id: 1),
        .init(title: .downwardFacingDog, image: "downwardFacingDog",  id: 2),
        .init(title: .kingPegion, image: "kingPegion", id: 3),
        .init(title: .revolvedTriangle, image: "revolvedTriangle",  id: 4),
        .init(title: .singleLegDownward, image: "singleLegDownward", id: 5),
        .init(title: .spineTwisting, image: "spineTwisting", id: 6),
        .init(title: .treePose, image: "treePose",  id: 7),
        .init(title: .upwardFacing, image: "upwardFacing",  id: 8),
        .init(title: .warrior, image: "warrior", id: 9)
    ]
    var body: some View {
        ZStack{
        ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing:20 ) {
                    ForEach(data, id: \.id) { pose in 
                        YogaCard(yogaPose: pose.title, data: pose)
                    }
                }.padding()
       
                
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct YogaScrollView_Previews: PreviewProvider {
    static var previews: some View {
        YogaScrollView()
    }
}
