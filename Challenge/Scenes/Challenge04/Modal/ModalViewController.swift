//
//  ModalViewController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 20/08/22.
//

import UIKit

final class ModalViewController: UIViewController {
	
	private var customView: ModalView?
	private let viewModel: ModalViewModelProtocol
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .clear
		setupView()
		setupResultField()
	}
	
	init(viewModel: ModalViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupView() {
		customView = ModalView()
		self.view = customView
	}
	
	private func setupResultField() {
//		guard let safeNumber = viewModel.result else { return }
		let safeNumber = viewModel.getRandomResult
		
		customView?.setResultLabel(with: safeNumber, index: 1)
	}
}
