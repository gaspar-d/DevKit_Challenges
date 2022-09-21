//
//  MainController.swift
//  Creatiing a List
//
//  Created by Diogo Gaspar on 04/06/22.
//

import UIKit

final class MainController: UIViewController {
	
	private var customView: MainViewProtocol
	private let viewModel: MainViewModelProtocol
	private var tableViewDelegate: TableViewDelegate?
	private var tableViewDataSource: TableViewDataSource?
	
	init(customView: MainViewProtocol,
		 viewModel: MainViewModelProtocol)
	{
		self.customView = customView
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		// TODO: - testing a fatalError()
		fatalError("Storyboard not founded")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupView()
		setupTableView()
	}
	
	private func setupView() {
		navigationController?.navigationBar.prefersLargeTitles = true
		title = "DevKit Challenges"
		
		view = customView as? UIView
	}
	
	private func setupTableView() {
		let delegate = TableViewDelegate(withDelegate: self)
		let dataSource = TableViewDataSource(withData: viewModel.getNames)
		
		tableViewDelegate = delegate
		tableViewDataSource = dataSource
		
		customView.setTableViewProtocols(withDelegate: delegate,
										  withDataSource: dataSource)
	}
}

// MARK: - TableViewDelegate

extension MainController: TableControllerDelegate {
	func didSelectCell(item: Int) {
		viewModel.didTapCell(index: item)
	}
}
