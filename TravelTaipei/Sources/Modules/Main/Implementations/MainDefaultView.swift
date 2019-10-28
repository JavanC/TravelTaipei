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
    var touristSites: [TouristSite] = []
    var tableView: UITableView!
    var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
        self.configureTableView()
        self.configureActivityIndicator()
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
        self.tableView.allowsSelection = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(tableView)
        self.tableView.snp.makeConstraints { maker in
            maker.edges.equalTo(view)
        }
        let nib = UINib(nibName:"TouristSiteTableViewCell", bundle:nil)
        self.tableView.register(nib, forCellReuseIdentifier:"TouristCell")
    }
    
    func configureActivityIndicator() {
        self.activityIndicator = UIActivityIndicatorView(style: .gray)
        self.view.addSubview(activityIndicator)
        self.activityIndicator.snp.makeConstraints { maker in
            maker.center.equalTo(view)
        }
    }
}

extension MainDefaultView: MainView {
    
    func display(touristSites: [TouristSite]) {
        // Setup IndexPaths
        let initialIndex = self.touristSites.count
        var indexPaths: [IndexPath] = []
        for index in 0..<touristSites.count {
            let indexPath = IndexPath(item: initialIndex + index, section: 0)
            indexPaths.append(indexPath)
        }
        
        // Add new tourist sites
        self.touristSites += touristSites
        
        // Insert indexPaths at bottom with none animation
        UIView.setAnimationsEnabled(false)
        self.tableView.insertRows(at: indexPaths, with: .none)
        UIView.setAnimationsEnabled(true)
    }
    
    func display(error: Error) {
        let alert = UIAlertController(title: "Oops!", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayLoading() {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
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
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // UITableView only moves in one direction, y axis
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.bounds.height
        
        // Change 10.0 to adjust the distance from bottom
        if maximumOffset - currentOffset <= 10.0 {
            let startIndex = touristSites.count
            self.presenter?.touristSites(from: startIndex, to: startIndex + 9)
        }
    }
}
