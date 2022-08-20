//
//  ModalView.swift
//  Challenge
//
//  Created by Diogo Gaspar on 20/08/22.
//

import UIKit

final class ModalView: UIView {
	
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
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension ModalView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(containerView)
		containerView.addSubview(labelText)
	}
	
	
	func setupConstraints() {
		
		NSLayoutConstraint.activate([
			containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
			containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			labelText.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
			labelText.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
		])
	}
}
