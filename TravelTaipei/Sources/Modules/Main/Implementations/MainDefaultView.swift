//
//  MainDefaultView.swift
//  TravelTaipei
//
//  Created by Javan on 2019/10/25.
//  Copyright © 2019 Javan. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class MainDefaultView: UIViewController {
    
    var presenter: MainPresenter?
    var tableView: UITableView!
    var touristSites: [TouristSite] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
        self.configureTableView()
        self.presenter?.viewDidLoad()
    }
    
    // MARK: - Configure
    func configureNavigationBar() {
        self.title = "台北市熱門景點"
        let barTintColor = UIColor(red: 70/255, green: 191/255, blue: 233/255, alpha: 1.0)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = barTintColor
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func configureTableView() {
        self.tableView = UITableView()
        self.tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints { maker in
            maker.edges.equalTo(view)
        }
        let nib = UINib(nibName:"TouristSiteTableViewCell", bundle:nil)
        self.tableView.register(nib, forCellReuseIdentifier:"TouristCell")
    }
}

extension MainDefaultView: MainView {
    
    func display(touristSites: [TouristSite]) {
        self.touristSites = touristSites
        self.tableView.reloadData()
    }
}

extension MainDefaultView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return touristSites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TouristCell", for: indexPath) as! TouristSiteTableViewCell
        cell.configure(touristSit: touristSites[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        print("Select tableview cell")
    }
}
