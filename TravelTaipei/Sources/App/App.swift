//
//  App.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/26.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation

class App {
    
    static let shared = App()
    
    var apiServices: ApiServices {
        return DataTaipeiService()
    }
}
