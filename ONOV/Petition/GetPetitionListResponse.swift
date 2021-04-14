//
//  GetPetitionListResponse.swift
//  ONOV
//
//  Created by anil kumar on 01/04/21.
//

import Foundation

struct GetPetitionListResponse : Codable {
    let status : String?
    let msg : String?
    let petitionArray : [PetitionArray]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case msg = "msg"
        case petitionArray = "petitionArray"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
        petitionArray = try values.decodeIfPresent([PetitionArray].self, forKey: .petitionArray)
    }

}



struct PetitionArray : Codable {
    let id : String?
    let userId : String?
    let sentFrom : String?
    let amount : String?
    let petitionDate : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case userId = "userId"
        case sentFrom = "sentFrom"
        case amount = "amount"
        case petitionDate = "petitionDate"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        userId = try values.decodeIfPresent(String.self, forKey: .userId)
        sentFrom = try values.decodeIfPresent(String.self, forKey: .sentFrom)
        amount = try values.decodeIfPresent(String.self, forKey: .amount)
        petitionDate = try values.decodeIfPresent(String.self, forKey: .petitionDate)
    }

}
