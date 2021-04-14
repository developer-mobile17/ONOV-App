//
//  LoginModel.swift
//  ONOV
//
//  Created by anil kumar on 15/03/21.
//

import Foundation
struct LoginModelRequest:Encodable {
    let FieldType: String
    let email: String
    let Password: String
    let Role: String
    let deviceToken: String
    let deviceType: String

}

struct LoginModelResponse:Codable {
    let status : String?
    let msg : String?
    let varification : String?
    let base_url : String?
    let userInfo : UserInfo?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case msg = "msg"
        case varification = "varification"
        case base_url = "base_url"
        case userInfo = "UserInfo"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        varification = try values.decodeIfPresent(String.self, forKey: .varification)
        base_url = try values.decodeIfPresent(String.self, forKey: .base_url)
        userInfo = try values.decodeIfPresent(UserInfo.self, forKey: .userInfo)
    }

}

struct UserInfo : Codable {
    let id : String?
    let userRef : String?
    let fullName : String?
    let email : String?
    let countryCode : String?
    let phone : String?
    let password : String?
    let notification : String?
    let donationsVisible : String?
    let profilePic : String?
    let role : String?
    let deviceType : String?
    let deviceToken : String?
    let loginStatus : String?
    let is_Active : String?
    let validationCode : String?
    let created_at : String?
    let updated_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case userRef = "userRef"
        case fullName = "fullName"
        case email = "email"
        case countryCode = "countryCode"
        case phone = "phone"
        case password = "password"
        case notification = "notification"
        case donationsVisible = "donationsVisible"
        case profilePic = "profilePic"
        case role = "role"
        case deviceType = "deviceType"
        case deviceToken = "deviceToken"
        case loginStatus = "loginStatus"
        case is_Active = "Is_Active"
        case validationCode = "validationCode"
        case created_at = "created_at"
        case updated_at = "updated_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        userRef = try values.decodeIfPresent(String.self, forKey: .userRef)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        countryCode = try values.decodeIfPresent(String.self, forKey: .countryCode)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        notification = try values.decodeIfPresent(String.self, forKey: .notification)
        donationsVisible = try values.decodeIfPresent(String.self, forKey: .donationsVisible)
        profilePic = try values.decodeIfPresent(String.self, forKey: .profilePic)
        role = try values.decodeIfPresent(String.self, forKey: .role)
        deviceType = try values.decodeIfPresent(String.self, forKey: .deviceType)
        deviceToken = try values.decodeIfPresent(String.self, forKey: .deviceToken)
        loginStatus = try values.decodeIfPresent(String.self, forKey: .loginStatus)
        is_Active = try values.decodeIfPresent(String.self, forKey: .is_Active)
        validationCode = try values.decodeIfPresent(String.self, forKey: .validationCode)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
    }

}

