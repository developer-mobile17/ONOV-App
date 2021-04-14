//
//  AddPetitionModel.swift
//  ONOV
//
//  Created by anil kumar on 01/04/21.
//

import Foundation
struct AddPetitionRequest:Codable {
    let userId: String
    let amount: String
    let petitionDate: String
    let discription: String
}

struct AddPetitionResponse:Codable {
    let status : String?
    let msg : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case msg = "msg"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        msg = try values.decodeIfPresent(String.self, forKey: .msg)
    }

}
