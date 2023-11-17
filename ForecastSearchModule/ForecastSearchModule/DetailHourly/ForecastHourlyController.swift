//
//  ForecastHourlyController.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit

public protocol ForecastHourlyControllerProtocol: AnyObject {
    func reloadData()
    func setTitle(text: String)
}

final class ForecastHourlyController: UITableViewController {
    var presenter: ForecastHourlyPresenterProtocol!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(HourlyCell.self)
        view.backgroundColor = .systemBackground
        presenter.load()
    }
}

extension ForecastHourlyController: ForecastHourlyControllerProtocol {
    func reloadData() {
        tableView.reloadData()
    }
    
    func setTitle(text: String) {
        title = text
    }
}

extension ForecastHourlyController {
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.hourlyDTO.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HourlyCell = tableView.dequeueReusableCell(for: indexPath)
        cell.presenter = .init(hourlyDTO: presenter.hourlyDTO[indexPath.row], view: cell)
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
