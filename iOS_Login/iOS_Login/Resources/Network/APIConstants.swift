//
//  APIConstants.swift
//  iOS_Login
//
//  Created by 이유진 on 2020/05/16.
//  Copyright © 2020 이유진. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://13.209.144.115:3333"
    static let signinURL = APIConstants.baseURL + "/user/signin"
    static let signupURL = APIConstants.baseURL + "/user/signup"
}
