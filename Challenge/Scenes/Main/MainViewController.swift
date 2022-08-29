//
//  MainViewController.swift
//  Creatiing a List
//
//  Created by Diogo Gaspar on 04/06/22.
//

import UIKit

final class MainViewController: UIViewController {
	
	private var customView: MainView?
	private let viewModel: MainViewModelProtocol
	private var tableViewDelegate: TableViewDelegate?
	private var tableViewDataSource: TableViewDataSource?
	
	init(viewModel: MainViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupTableView()
	}
	
	private func setupView() {
		navigationController?.navigationBar.prefersLargeTitles = true
		title = "DevKit Challenges"
		
		customView = MainView()
		view = customView
	}
	
	private func setupTableView() {
		let delegate = TableViewDelegate(withDelegate: self)
		let dataSource = TableViewDataSource(withData: viewModel.getNames)
		
		tableViewDelegate = delegate
		tableViewDataSource = dataSource
		
		customView?.setTableViewProtocols(withDelegate: delegate,
										  withDataSource: dataSource)
	}
}

// MARK: - TableViewDelegate
extension MainViewController: TableControllerDelegate {
	func didSelectedCell(item: Int) {
		viewModel.didTapCell(index: item)
	}
}
