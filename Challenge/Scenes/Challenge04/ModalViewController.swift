//
//  ModalViewController.swift
//  Challenge
//
//  Created by Diogo Gaspar on 20/08/22.
//

import UIKit

final class ModalViewController: UIViewController {
	
	private lazy var containerView: UIView = {
		let container = UIView()
		container.translatesAutoresizingMaskIntoConstraints = false
		container.backgroundColor = .white
		container.layer.cornerRadius = 16
		
		return container
	}()
	
	private lazy var labelText: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Modalzão"
		
		return label
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .clear
		setupConstraints()
	}
	
	func setupConstraints() {
		view.addSubview(containerView)
		containerView.addSubview(labelText)
		
		NSLayoutConstraint.activate([
			containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
			containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			
			labelText.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
			labelText.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
		])
	}
}
