//
//  News.swift
//  BeritaIndo
//
//  Created by Ahmad Baraas on 19/10/23.
//

import Foundation

struct News : Decodable {
    let title: String
    let link: String
    let content: String
    let isoDate: String
        
    enum CodingKeys: String, CodingKey {
        case title
        case link
        case content
        case isoDate
       

        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.link = try container.decodeIfPresent(String.self, forKey: .link) ?? ""
        self.content = try container.decodeIfPresent(String.self, forKey: .content) ?? ""
        self.isoDate = try container.decodeIfPresent(String.self, forKey: .isoDate) ?? ""

    }
}
