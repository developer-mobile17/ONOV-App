//
//  StatsModelResponse.swift
//  ONOV
//
//  Created by anil kumar on 16/03/21.
//

import Foundation

struct StatsModelResponse : Codable {
    let status : String?
    let msg : String?
    let data : [StatsData]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case msg = "msg"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        data = try values.decodeIfPresent([StatsData].self, forKey: .data)
    }

}

struct StatsData : Codable {
    let id : String?
    let notifyTo : String?
    let notifyFrom : String?
    let notificationText : String?
    let create_at : String?
    let update_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case notifyTo = "notifyTo"
        case notifyFrom = "notifyFrom"
        case notificationText = "notificationText"
        case create_at = "create_at"
        case update_at = "update_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        notifyTo = try values.decodeIfPresent(String.self, forKey: .notifyTo)
        notifyFrom = try values.decodeIfPresent(String.self, forKey: .notifyFrom)
        notificationText = try values.decodeIfPresent(String.self, forKey: .notificationText)
        create_at = try values.decodeIfPresent(String.self, forKey: .create_at)
        update_at = try values.decodeIfPresent(String.self, forKey: .update_at)
    }

}


