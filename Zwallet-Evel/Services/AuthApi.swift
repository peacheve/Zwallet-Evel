//
//  AuthApi.swift
//  Zwallet-Evel
//
//  Created by DDL10 on 18/08/23.
//

import Foundation
import Moya
import RxSwift


enum AuthApi {
    case login(String, String)
    case register(String, String, String)
    case forgotPassword(String, String)
    case logout
}

let base_URL = "http://54.158.117.176:8000"

extension AuthApi: TargetType {
    var baseURL: URL {
        return URL(string: base_URL)!
//        return URL(string: Constant.baseURL)
    }
    
    var path: String{
        switch self {
        case.login:
            return "/auth/login"
        case.register:
            return "/auth/signup"
        case.forgotPassword:
            return "/auth/reset"
        case.logout:
            return "/auth/logout/\(Constant.token ?? "")"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return.post
        case .register:
            return.post
        case .forgotPassword:
            return.patch
        case .logout:
            return.delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(parameters: ["email" : email, "password": password], encoding: JSONEncoding.default)
        case .register(let username, let email, let password):
            return
                .requestParameters(parameters: ["username": username, "email" : email, "password": password], encoding: JSONEncoding.default)
        case .forgotPassword(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case .logout:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .login:
            return nil
        case .register:
            return nil
        case .forgotPassword:
            return nil
        case .logout:
            return ["Authorization": "Bearer \(Constant.token ?? "")"]
            //return nil
//        case .getProfile:
//            return("Authorization": "Bearer \(Constant.Token ??"")")
        }
    }
}
