//
//  TouristSite.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/26.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation

struct TouristInfo: Codable {
    
    let result: TouristResult
}

struct TouristResult: Codable {
    
    let limit: Int
    let results: [TouristSite]
}

struct TouristSite: Codable {
    
    let stitle: String
    let xbody: String
    let file: String
    
    var imageUrlList: [String] {
        return file.components(separatedBy: "http://").filter{ $0.lowercased().contains(".jpg") }.map{ "http://" + $0 }
    }
}
