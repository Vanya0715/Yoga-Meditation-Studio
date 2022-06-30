//
//  YogaPoseLottieScreen.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 08/06/22.
//

import SwiftUI

let appearance = UINavigationBarAppearance()


struct YogaPoseLottieScreen: View {
    @State var yogaPose: YogaPose
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green.opacity(0.3), .teal.opacity(0.7)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            CircularSliderView(data: yogaPose)
        }.navigationBarHidden(true)
    }
}

struct YogaPoseLottieScreen_Previews: PreviewProvider {
    static var previews: some View {
        YogaPoseLottieScreen(yogaPose: .treePose)
    }
}
