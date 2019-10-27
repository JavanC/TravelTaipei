//
//  ApiServices.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/26.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation

protocol ApiServices {
    
    func touristSites(from: Int, to: Int) -> Observable<[TouristSite]>
}
