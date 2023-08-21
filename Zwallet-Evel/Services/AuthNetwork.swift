//
//  AuthNetwork.swift
//  Zwallet-Evel
//
//  Created by DDL10 on 18/08/23.
//

import Foundation
import Moya
import Alamofire

class AuthNetwork {
    func login(email: String, password: String, completion: @escaping (LoginDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>(
            plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))]
        )
        provider.request(.login(email,  password)) { response in
            switch response{
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let loginResponse = try decoder.decode(LoginModel.self, from: result.data)
                    completion(loginResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func register(username: String, email: String, password: String, completion: @escaping (RegisterModel?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>(
            plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))]
        )
        provider.request(.register(username, email, password)) { response in
            switch response{
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let registerModel = try decoder.decode(RegisterModel.self, from: result.data)
                    completion(registerModel, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func forgotPassword(email: String, password: String, completion: @escaping (ForgotPassword?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>(
            plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))]
        )
        provider.request(.forgotPassword(email, password)) { response in
            switch response{
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let forgotPassword = try decoder.decode(ForgotPassword.self, from: result.data)
                    completion(forgotPassword, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    func logout(completion: @escaping (LogoutModel?) -> ()) {
        let provider = MoyaProvider<AuthApi>(
            plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))]
        )
        provider.request(.logout) { response in
            switch response{
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let logout = try decoder.decode(LogoutModel.self, from: result.data)
                    completion(logout)
                } catch _ {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
}
