//
//  YogaPoseModel.swift
//  Yoga&MeditationStudio
//
//  Created by Divyansh Dwivedi on 07/06/22.
//

import Foundation
struct CardDetails {
    var title: YogaPose
    var image: String
    var id: Int
}

enum YogaPose: String {
    case downwardFacingDog = "Down Facing Dog "
    case singleLegDownward = "One Leg Down"
    case treePose = "Tree Pose"
    case upwardFacing = "Upward Facing"
    case warrior = "Warrior"
    case balancing = "Balancing"
    case catCow = "Cat Cow"
    case kingPegion = "King Pegion"
    case revolvedTriangle = "Revolved Triangle"
    case spineTwisting = "Spine Twisting"
}
