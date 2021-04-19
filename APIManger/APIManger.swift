//
//  APIManger.swift
//  ONOV
//
//  Created by anil kumar on 15/03/21.
//

import Foundation
import Alamofire

enum APIError:Error {
    case custom(message:String)
}
typealias Handler = (Swift.Result<Any?,APIError>) ->Void

//MARK: API Calling

//TODO:- Login API
class APIManger {
    static let shareInstance = APIManger()

    func callingLoginAPI(loginParam:LoginModelRequest, completionHandler: @escaping Handler) {

        var headers: HTTPHeaders = [:]
        headers = [
            "X-API-KEY":"onovApp@onovapplication.com"

        ]

        AF.request(LoginURL,
                   method: .post,
                   parameters: loginParam,
                   encoder: URLEncodedFormParameterEncoder.default,
                   headers: headers).response {
                    response in

                    switch response.result{
                    case .success(let data):
                        do {

                            let jsonDecoder = JSONDecoder()
                            let responseModel = try jsonDecoder.decode(LoginModelResponse.self, from: data!)
                            if response.response?.statusCode == 200{
                                completionHandler(.success(responseModel))
                                print("Success Go to Home UI")
                            }
                            else {
                                // ProgressHUD.dismiss()
                                print("There is an issue with login API, Please check!")
                            }

                        } catch  {
                            // ProgressHUD.dismiss()
                            print(error.localizedDescription)
                        }

                    case .failure(let err):
                        print(err.localizedDescription)
                    }

                   }
    }









    func callingSignUpAPI(signUpParam:signUpRequest, completionHandler: @escaping Handler) {

        var headers: HTTPHeaders = [:]
        headers = [
            "X-API-KEY":"onovApp@onovapplication.com"

        ]

        AF.request(SignUpURL,
                   method: .post,
                   parameters: signUpParam,
                   encoder: URLEncodedFormParameterEncoder.default,
                   headers: headers).response {
                    response in

                    switch response.result{
                    case .success(let data):
                        do {

                            let jsonDecoder = JSONDecoder()
                            let responseModel = try jsonDecoder.decode(signUpResponse.self, from: data!)
                            if response.response?.statusCode == 200{
                                completionHandler(.success(responseModel))
                                print("Success Go to Home UI")
                            }
                            else {
                                // ProgressHUD.dismiss()
                                print("There is an issue with user Register API, Please check!")
                            }

                        } catch  {
                            // ProgressHUD.dismiss()
                            print(error.localizedDescription)
                        }

                    case .failure(let err):
                        print(err.localizedDescription)
                    }

                   }
    }





    func callingGetAllWinnerAPI(completionHandler: @escaping Handler) {


        var headers: HTTPHeaders = [:]
        headers = [
            "X-API-KEY":"onovApp@onovapplication.com"

        ]

        AF.request(GetAllWinnerURL,
                   method: .get,
                   parameters: nil,
                   headers: headers).response {
                    response in

                    switch response.result{
                    case .success(let data):
                        do {

                            let jsonDecoder = JSONDecoder()
                            let responseModel = try jsonDecoder.decode(GetAllWinnerResponse.self, from: data!)
                            if response.response?.statusCode == 200{
                                completionHandler(.success(responseModel))
                                print("Success ")
                            }
                            else {
                                // ProgressHUD.dismiss()
                                print("There is an issue with GetAllWinner, Please check!")
                            }

                        } catch  {
                            // ProgressHUD.dismiss()
                            print(error.localizedDescription)
                        }

                    case .failure(let err):
                        print(err.localizedDescription)
                    }

                   }
    }



    func callingGetNotificatoinAPI(completionHandler: @escaping Handler) {

        let  userRef = "\("/")\(UserDefaults.standard.value(forKey: "userRefDefaults") as! String)"
        var headers: HTTPHeaders = [:]
        headers = [
            "X-API-KEY":"onovApp@onovapplication.com"

        ]

        AF.request( "\(GetNotificationURL)\(userRef)",
                   method: .get,
                   parameters: nil,
                   headers: headers).response {
                    response in

                    switch response.result{
                    case .success(let data):
                        do {

                            let jsonDecoder = JSONDecoder()
                            let responseModel = try jsonDecoder.decode(NotificationModelResponse.self, from: data!)
                            if response.response?.statusCode == 200{
                                completionHandler(.success(responseModel))
                                print("Success ")
                            }
                            else {
                                // ProgressHUD.dismiss()
                                print("There is an issue with GetNotificationURL, Please check!")
                            }

                        } catch  {
                            // ProgressHUD.dismiss()
                            print(error.localizedDescription)
                        }

                    case .failure(let err):
                        print(err.localizedDescription)
                    }

                   }
    }




    func callingGetStatsAPI(completionHandler: @escaping Handler) {

        let  userRef = "\("/")\(UserDefaults.standard.value(forKey: "userRefDefaults") as! String)"
        var headers: HTTPHeaders = [:]
        headers = [
            "X-API-KEY":"onovApp@onovapplication.com"

        ]

        AF.request( "\(GetStatsURL)\(userRef)",
                   method: .get,
                   parameters: nil,
                   headers: headers).response {
                    response in

                    switch response.result{
                    case .success(let data):
                        do {

                            let jsonDecoder = JSONDecoder()
                            let responseModel = try jsonDecoder.decode(StatsModelResponse.self, from: data!)
                            if response.response?.statusCode == 200{
                                completionHandler(.success(responseModel))
                                print("Success ")
                            }
                            else {
                                // ProgressHUD.dismiss()
                                print("There is an issue with GetStatsURL, Please check!")
                            }

                        } catch  {
                            // ProgressHUD.dismiss()
                            print(error.localizedDescription)
                        }

                    case .failure(let err):
                        print(err.localizedDescription)
                    }

                   }
    }




    func callingGetDebateRequestAPI(completionHandler: @escaping Handler) {

        let  userRef = "\("/")\(UserDefaults.standard.value(forKey: "userRefDefaults") as! String)"
        var headers: HTTPHeaders = [:]
        headers = [
            "X-API-KEY":"onovApp@onovapplication.com"

        ]

        AF.request( "\(GetDebateRequestURL)\(userRef)",
                   method: .get,
                   parameters: nil,
                   headers: headers).response {
                    response in

                    switch response.result{
                    case .success(let data):
                        do {

                            let jsonDecoder = JSONDecoder()
                            let responseModel = try jsonDecoder.decode(GetDebateModelResponse.self, from: data!)
                            if response.response?.statusCode == 200{
                                completionHandler(.success(responseModel))
                                print("Success ")
                            }
                            else {
                                // ProgressHUD.dismiss()
                                print("There is an issue with GetDebateRequestURL, Please check!")
                            }

                        } catch  {
                            // ProgressHUD.dismiss()
                            print(error.localizedDescription)
                        }

                    case .failure(let err):
                        print(err.localizedDescription)
                    }

                   }
    }




    func callingGetPetitionListAPI(completionHandler: @escaping Handler) {

        var headers: HTTPHeaders = [:]
        headers = [
            "X-API-KEY":"onovApp@onovapplication.com"

        ]

        AF.request(GetPetitionListURL,
                   method: .get,
                   parameters: nil,
                   headers: headers).response {
                    response in

                    switch response.result{
                    case .success(let data):
                        do {

                            let jsonDecoder = JSONDecoder()
                            let responseModel = try jsonDecoder.decode(GetPetitionListResponse.self, from: data!)
                            if response.response?.statusCode == 200{
                                completionHandler(.success(responseModel))
                                print("Success ")
                            }
                            else {
                                // ProgressHUD.dismiss()
                                print("There is an issue with  Petition List URL, Please check!")
                            }

                        } catch  {
                            // ProgressHUD.dismiss()
                            print(error.localizedDescription)
                        }

                    case .failure(let err):
                        print(err.localizedDescription)
                    }

                   }
    }




    func callingAddPetitionAPI(AddPetitionParam:AddPetitionRequest, completionHandler: @escaping Handler) {

        var headers: HTTPHeaders = [:]
        headers = [
            "X-API-KEY":"onovApp@onovapplication.com"

        ]

        AF.request(AddPetitionURL,
                   method: .post,
                   parameters: AddPetitionParam,
                   encoder: URLEncodedFormParameterEncoder.default,
                   headers: headers).response {
                    response in

                    switch response.result{
                    case .success(let data):
                        do {

                            let jsonDecoder = JSONDecoder()
                            let responseModel = try jsonDecoder.decode(AddPetitionResponse.self, from: data!)
                            if response.response?.statusCode == 200{
                                completionHandler(.success(responseModel))
                                print("Success Go to Home UI")
                            }
                            else {
                                // ProgressHUD.dismiss()
                                print("There is an issue with addPetition API, Please check!")
                            }

                        } catch  {
                            // ProgressHUD.dismiss()
                            print(error.localizedDescription)
                        }

                    case .failure(let err):
                        print(err.localizedDescription)
                    }

                   }
    }



    
    
    func callingGetHomeFeedAPI(HomeFeedParam:HomeFeedRequest, completionHandler: @escaping Handler) {

        var headers: HTTPHeaders = [:]
        headers = [
            "X-API-KEY":"onovApp@onovapplication.com"

        ]

        AF.request(GetHomeFeedURL,
                   method: .post,
                   parameters: HomeFeedParam,
                   encoder: URLEncodedFormParameterEncoder.default,
                   headers: headers).response {
                    response in

                    switch response.result{
                    case .success(let data):
                        do {

                            let jsonDecoder = JSONDecoder()
                            let responseModel = try jsonDecoder.decode(HomeFeedResponse.self, from: data!)
                            if response.response?.statusCode == 200{
                                completionHandler(.success(responseModel))
                                print("Success Get Home Feed")
                            }
                            else {
                                // ProgressHUD.dismiss()
                                print("There is an issue with GetHomeFeedURL API, Please check!")
                            }

                        } catch  {
                            // ProgressHUD.dismiss()
                            print(error.localizedDescription)
                        }

                    case .failure(let err):
                        print(err.localizedDescription)
                    }

                   }
    }



    
    func callingGetUserInfoAPI(GetUserInfoParam:GetUserInfoRequest, completionHandler: @escaping Handler) {

        var headers: HTTPHeaders = [:]
        headers = [
            "X-API-KEY":"onovApp@onovapplication.com"

        ]

        AF.request(GetUserInfoURL,
                   method: .post,
                   parameters: GetUserInfoParam,
                   encoder: URLEncodedFormParameterEncoder.default,
                   headers: headers).response {
                    response in

                    switch response.result{
                    case .success(let data):
                        do {

                            let jsonDecoder = JSONDecoder()
                            let responseModel = try jsonDecoder.decode(GetUserInfoResponse.self, from: data!)
                            if response.response?.statusCode == 200{
                                completionHandler(.success(responseModel))
                                print("Success GetUserInfoURL")
                            }
                            else {
                                // ProgressHUD.dismiss()
                                print("There is an issue with GetUserInfoURL API, Please check!")
                            }

                        } catch  {
                            // ProgressHUD.dismiss()
                            print(error.localizedDescription)
                        }

                    case .failure(let err):
                        print(err.localizedDescription)
                    }

                   }
    }




}
