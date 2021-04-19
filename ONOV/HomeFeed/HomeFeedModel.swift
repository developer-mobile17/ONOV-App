//
//  HomeFeedModel.swift
//  ONOV
//
//  Created by wbmb on 19/04/21.
//

import Foundation
struct HomeFeedRequest:Encodable {
    let userId:String
}


struct HomeFeedResponse:Codable {
    let status : String?
    let msg : String?
    let data : [DataFeed]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case msg = "msg"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        data = try values.decodeIfPresent([DataFeed].self, forKey: .data)
    }

}


struct DataFeed : Codable {
    let id : String?
    let userId : String?
    let name : String?
    let profilePic : String?
    let title : String?
    let description : String?
    let filePath : String?
    let fileType : String?
    let recordType : String?
    let created_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case userId = "userId"
        case name = "Name"
        case profilePic = "profilePic"
        case title = "title"
        case description = "description"
        case filePath = "filePath"
        case fileType = "fileType"
        case recordType = "recordType"
        case created_at = "created_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        userId = try values.decodeIfPresent(String.self, forKey: .userId)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        profilePic = try values.decodeIfPresent(String.self, forKey: .profilePic)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        filePath = try values.decodeIfPresent(String.self, forKey: .filePath)
        fileType = try values.decodeIfPresent(String.self, forKey: .fileType)
        recordType = try values.decodeIfPresent(String.self, forKey: .recordType)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
    }

}

