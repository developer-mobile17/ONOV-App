//
//  GetDebateRequestModel.swift
//  ONOV
//
//  Created by anil kumar on 16/03/21.
//

import Foundation

struct GetDebateModelResponse : Codable {
    let status : String?
    let msg : String?
    let date : [GetDebateRequestDate]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case msg = "msg"
        case date = "date"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        date = try values.decodeIfPresent([GetDebateRequestDate].self, forKey: .date)
    }

}

struct GetDebateRequestDate : Codable {
    let requestId : String?
    let title : String?
    let date : String?
    let time : String?
    let requestStatus : String?

    enum CodingKeys: String, CodingKey {

        case requestId = "requestId"
        case title = "title"
        case date = "date"
        case time = "time"
        case requestStatus = "requestStatus"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        requestId = try values.decodeIfPresent(String.self, forKey: .requestId)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        time = try values.decodeIfPresent(String.self, forKey: .time)
        requestStatus = try values.decodeIfPresent(String.self, forKey: .requestStatus)
    }

}
