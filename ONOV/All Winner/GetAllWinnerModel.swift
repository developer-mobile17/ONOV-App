//
//  GetAllWinnerModel.swift
//  ONOV
//
//  Created by anil kumar on 15/03/21.
//

import Foundation

struct GetAllWinnerResponse : Codable {
    let status : String?
    let msg : String?
    let base_url : String?
    let data : [Data]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case msg = "msg"
        case base_url = "base_url"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        base_url = try values.decodeIfPresent(String.self, forKey: .base_url)
        data = try values.decodeIfPresent([Data].self, forKey: .data)
    }

}


struct Data : Codable {
    let id : String?
    let debateId : String?
    let winnerRef : String?
    let create_at : String?
    let update_at : String?
    let winCount : String?
    let fullName : String?
    let profilePic : String?
    let rank : Int?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case debateId = "debateId"
        case winnerRef = "winnerRef"
        case create_at = "create_at"
        case update_at = "update_at"
        case winCount = "winCount"
        case fullName = "fullName"
        case profilePic = "profilePic"
        case rank = "Rank"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        debateId = try values.decodeIfPresent(String.self, forKey: .debateId)
        winnerRef = try values.decodeIfPresent(String.self, forKey: .winnerRef)
        create_at = try values.decodeIfPresent(String.self, forKey: .create_at)
        update_at = try values.decodeIfPresent(String.self, forKey: .update_at)
        winCount = try values.decodeIfPresent(String.self, forKey: .winCount)
        fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
        profilePic = try values.decodeIfPresent(String.self, forKey: .profilePic)
        rank = try values.decodeIfPresent(Int.self, forKey: .rank)
    }

}
