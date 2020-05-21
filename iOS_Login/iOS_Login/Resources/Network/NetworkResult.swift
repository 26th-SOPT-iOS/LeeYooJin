//
//  NetworkResult.swift
//  iOS_Login
//
//  Created by 이유진 on 2020/05/16.
//  Copyright © 2020 이유진. All rights reserved.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
