//
//  FriendInformation.swift
//  iOS_Login
//
//  Created by 이유진 on 2020/05/15.
//  Copyright © 2020 이유진. All rights reserved.
//

import Foundation

struct FriendInfromation{
    var profileImg: Proimg
    var name: String
    var message: String
}
enum Proimg{
    case pro1
    case pro2
    case pro3
    case pro4
    case pro5
    case pro6
    case pro7
    case pro8
    case pro9
    
    func getImageName() -> String{
        switch self {
        case .pro1:
            return "profile1Img"
        case .pro2:
            return "profile2Img"
        case .pro3:
            return "profile3Img"
        case .pro4:
            return "profile4Img"
        case .pro5:
            return "profile5Img"
        case .pro6:
            return "profile6Img"
        case .pro7:
            return "profile7Img"
        case .pro8:
            return "profile8Img"
        case .pro9:
            return "profile9Img"
        }
    }
    
}
