//
//  DetailDefaultView.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/30.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation
import UIKit

class DetailDefaultView: UIViewController {
    
    weak var presenter: DetailPresenter?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailDefaultView: DetailView {
    
}
