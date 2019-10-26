//
//  MainDefaultView.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/25.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation
import UIKit

class MainDefaultView: UIViewController {
    
    var presenter: MainPresenter?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.title = "台北市熱門景點"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
        self.view.backgroundColor = .lightGray
    }
}

extension MainDefaultView: MainView {
    
}
