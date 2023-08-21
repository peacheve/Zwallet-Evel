//
//  LoginDataResponse.swift
//  Zwallet-Evel
//
//  Created by DDL10 on 18/08/23.
//

import Foundation

struct LoginDataResponse: Codable {
    var id: Int
    var email: String
    var token: String
}
