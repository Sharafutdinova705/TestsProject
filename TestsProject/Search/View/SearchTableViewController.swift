//
//  SearchTableViewController.swift
//  TestsProject
//
//  Created by Гузель on 29/03/2019.
//  Copyright © 2019 Гузель. All rights reserved.
//

import UIKit
import SDWebImage
import SafariServices

class SearchTableViewController: UITableViewController, SearchViewInput {

    var output: SearchViewOutput!
    let searchController = UISearchController(searchResultsController: nil)
    var settings: Settings = Settings(typeOfMedia: "music", countOfResult: 100, kindOfDevice: "iphone")
    var foundedItems: [FoundedItem] = []
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    lazy var apimanager = APIManager(sessionConfiguration: URLSessionConfiguration.default)
    
    
    //MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        output.obtainItems()
    }
    
    //MARK: - Search
    
    /// настройки searchController
    func setupSearchController() {
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return foundedItems.count
        }
        return 0
    }

    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SearchTableViewCell
        
        if isFiltering {
            let item = foundedItems[indexPath.row]
            cell.titleLabel.text = item.titleLabel
            cell.authorLabel.text = item.authorLabel
            cell.descriptionLabel.text = item.descriptionLabel
            cell.priceLabel.text = item.priceLabel
            cell.itemImageView.sd_setImage(with: URL(string: item.itemImageView), completed: nil)
        }
        return cell
     }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = foundedItems[indexPath.row]
        let svc = SFSafariViewController(url: URL(string: item.url)!)
        self.present(svc, animated: true, completion: nil)
        
    }

    //MARK: - SearchViewInput
    
    @IBAction func showSettings(_ sender: Any) {
        output.showSettings()
    }
    
    func updateSettings(settings: Settings) {
        
        self.settings = settings
        self.tableView.reloadData()
    }
}

extension SearchTableViewController: UISearchResultsUpdating {
    
    /// срабатывает при нажатии на поиск или при введении букв
    ///
    /// - Parameter searchController: searchController
    func updateSearchResults(for searchController: UISearchController) {
        
        output.obtainItems()
        
        apimanager.fetchResultWith(term: searchController.searchBar.text!, settings: settings) { (result) in
            switch result {
            case .Success(let foundedItem):
                self.foundedItems = foundedItem
            case .Failure(let error):
                print(error.localizedDescription)
            }
            
        }
        self.tableView.reloadData()
    }
}
