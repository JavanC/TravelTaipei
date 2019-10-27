//
//  DataTaipeiService.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/26.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation

class DataTaipeiService: ApiServices {
    
    var baseUrl = "https://data.taipei/"
    var touristSitesPath = "opendata/datalist/apiAccess?scope=resourceAquire&rid=36847f3f-deff-4183-a5bb-800737591de5"
    
    func touristSites(from startIndex: Int, to endIndex: Int) -> Observable<[TouristSite]> {
        let url = URL(string: baseUrl + touristSitesPath)!
        let request = URLRequest(url: url)
        return URLSession.shared.rx.data(request: request).map { data -> [TouristSite] in
            let touristSites = try JSONDecoder().decode(TouristInfo.self, from: data).result.results
            guard touristSites.count > startIndex else { return [] }
            let endIndex = min(endIndex, touristSites.endIndex)
            return Array(touristSites[startIndex...endIndex])
        }
    }
}
