//
//  ForecastHourlyController.swift
//  ForecastSearchModule
//
//  Created by Oğuz Öztürk on 17.11.2023.
//

import UIKit
import Common

public protocol ForecastHourlyControllerProtocol: AnyObject {
    func setTitle(text: String)
    func setEmptyMessage(text: String)
}

private extension ForecastHourlyController {
    enum Constants {
        static let rowHeight: CGFloat = 80
    }
}

final class ForecastHourlyController: UITableViewController {
    var presenter: ForecastHourlyPresenterProtocol!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        prepareTableview()
        presenter.load()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func prepareTableview() {
        tableView.register(HourlyCell.self)
    }
}

extension ForecastHourlyController: ForecastHourlyControllerProtocol {
    func setTitle(text: String) {
        title = text
    }
    
    func setEmptyMessage(text: String) {
        tableView.setEmptyMessage(text)
    }
}

extension ForecastHourlyController {
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.hourlyDTO.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HourlyCell = tableView.dequeueReusableCell(for: indexPath)
        cell.presenter = .init(dto: presenter.hourlyDTO[indexPath.row], view: cell)
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.rowHeight
    }
}
