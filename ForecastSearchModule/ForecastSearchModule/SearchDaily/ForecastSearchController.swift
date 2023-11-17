//
//  ForecastSearchViewController.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit
import WeatherAPI
import Common
import CoreLocation

protocol ForecastSearchControllerProtocol: AnyObject {
    func showIndicator()
    func hideIndicator()
    func reloadData()
    func presentAlert(text: String)
}

final public class ForecastSearchController: UITableViewController {
    var presenter: ForecastSearchPresenterProtocol!
    private lazy var indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    private lazy var searchController: UISearchController = {
       let search = UISearchController(searchResultsController: nil)
        search.searchBar.delegate = self
        return search
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DailyCell.self)
        tableView.backgroundView = indicator
        view.backgroundColor = .systemBackground
        navigationItem.searchController = searchController
        presenter.load()
    }
}

extension ForecastSearchController: ForecastSearchControllerProtocol {
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func presentAlert(text: String) {
        showAlert(message: text)
    }
}

extension ForecastSearchController: UISearchBarDelegate {
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.geocodeAddress(for: searchBar.text)
    }
}

extension ForecastSearchController {
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.forecastDTO.daily.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DailyCell = tableView.dequeueReusableCell(for: indexPath)
        cell.presenter = .init(dailyDTO: presenter.forecastDTO.daily[indexPath.row], view: cell)
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelect(item: indexPath.row)
    }
}

extension ForecastSearchController: AlertShowable {}
