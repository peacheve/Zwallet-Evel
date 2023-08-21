//
//  LoginModel.swift
//  Zwallet-Evel
//
//  Created by DDL10 on 18/08/23.
//

import Foundation

struct LoginModel: Codable {
    var status: Int
    var message: String
    var data: LoginDataResponse
}
