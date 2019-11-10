//
//  MainViewController.swift
//  Reddit
//
//  Created by Igor Karyi on 08.11.2019.
//  Copyright © 2019 IK. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet fileprivate weak var tableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    
    private var viewModel: MainProtocol?
    
    private var childrenArray = [Children]()
    
    private var limit = 20
    
    private let spinner = UIActivityIndicatorView(style: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        viewModel = MainViewModel()
        getTopFeedWithLimit(limit, displayLoader: true)

        setupSpinner()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(R.nib.feedCell)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100.0
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshGetLibrary(_:)), for: .valueChanged)
    }
    
    private func setupSpinner() {
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
        tableView.tableFooterView = spinner
    }
    
    @objc private func refreshGetLibrary(_ sender: Any) {
        getTopFeedWithLimit(limit, displayLoader: true)
    }
    
    private func getTopFeedWithLimit(_ limit: Int, displayLoader: Bool) {
        if displayLoader {
            showHud()
        }
        viewModel?.getTopFeed(limit: limit, completion: { [weak self] (data, error) in
            guard let self = self else { return }
            if error != nil {
                print(error ?? "")
            } else {
                guard let data = data else { return }
                self.childrenArray = data
                self.tableView.reloadData()
            }
            self.endReload()
        })
    }
    
    private func endReload() {
        hideHud()
        refreshControl.endRefreshing()
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childrenArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.feedCell, for: indexPath)!
        
        cell.setModel(childrenArray[indexPath.row])
        
        if indexPath.row == childrenArray.count - 1 {
            limit = limit + 20
            
            spinner.startAnimating()
            tableView.tableFooterView?.isHidden = false
            
            getTopFeedWithLimit(limit, displayLoader: false)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
