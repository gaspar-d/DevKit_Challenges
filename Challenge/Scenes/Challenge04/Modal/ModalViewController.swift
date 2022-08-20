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
	
//	private lazy var containerView: UIView = {
//		let container = UIView()
//		container.translatesAutoresizingMaskIntoConstraints = false
//		container.backgroundColor = .white
//		container.layer.cornerRadius = 16
//		
//		return container
//	}()
//	
//	private lazy var labelText: UILabel = {
//		let label = UILabel()
//		label.translatesAutoresizingMaskIntoConstraints = false
//		label.text = "Modalzão"
//		
//		return label
//	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .clear
		setupView()
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
	
//	init(viewModel: ModalViewModelProtocol) {
//		self.viewModel = viewModel
//		super.init(nibName: nil, bundle: nil)
//	}
//	
//	required init?(coder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
	
//	func setupConstraints() {
//		view.addSubview(containerView)
//		containerView.addSubview(labelText)
//
//		NSLayoutConstraint.activate([
//			containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
//			containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//			containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//			containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//			labelText.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
//			labelText.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
//		])
//	}
}
