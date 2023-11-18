//
//  ForecastSearchViewController.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit
import WeatherAPI
import Common

protocol ForecastSearchControllerProtocol: AlertShowable {
    func setBarMenuTitle(_ text: String)
    func showIndicator()
    func hideIndicator()
    func reloadData()
}

private extension ForecastSearchController {
    enum Constants {
        static let indicatorFrame: CGRect = .init(x: 0, y: 0, width: 20, height: 20)
        static let rowHeight: CGFloat = 80
    }
}

final public class ForecastSearchController: UITableViewController {
    var presenter: ForecastSearchPresenterProtocol!
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(frame: Constants.indicatorFrame)
        indicator.style = .large
        return indicator
    }()
    
    private lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.delegate = self
        return search
    }()
    
    private lazy var menuBarButton: UIBarButtonItem = {
        let actions = TempatureUnit.allCases.map { [weak self] unit in
            UIAction(title: unit.rawValue.capitalized, image: UIImage(systemName: unit.systemImageName)) { _ in
                self?.presenter.updateUnit(unit)
            }
        }
        return UIBarButtonItem(
            title: UserDefaults.tempatureUnit.rawValue.capitalized,
            primaryAction: nil,
            menu: UIMenu(title: "", children: actions)
        )
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        prepareTableview()
        presenter.load()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        navigationItem.searchController = searchController
        navigationItem.rightBarButtonItem = menuBarButton
    }
    
    private func prepareTableview() {
        tableView.register(DailyCell.self)
        tableView.backgroundView = indicator
    }
}

extension ForecastSearchController: ForecastSearchControllerProtocol {
    func setBarMenuTitle(_ text: String) {
        menuBarButton.title = text
    }
    
    func showIndicator() {
        DispatchQueue.main.async {
            self.indicator.startAnimating()
        }
    }
    
    func hideIndicator() {
        DispatchQueue.main.async {
            self.indicator.stopAnimating()
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
        cell.presenter = .init(dto: presenter.forecastDTO.daily[indexPath.row], view: cell)
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.rowHeight
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelect(item: indexPath.row)
    }
}
