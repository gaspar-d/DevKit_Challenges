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
		container.backgroundColor = .systemBackground
		container.layer.cornerRadius = 16
		
		return container
	}()
	
	private lazy var resultLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		label.textColor = .systemIndigo
		label.font = .systemFont(ofSize: 22, weight: .semibold)
		
		return label
	}()
	
	private lazy var containerStack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [
												   resultLabel,
												  ])
		
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.alignment = .center
		stack.distribution = .equalSpacing
		stack.spacing = 20
		stack.backgroundColor = .systemBackground
		stack.layer.cornerRadius = 16
		stack.isLayoutMarginsRelativeArrangement = true
		stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0,
																 leading: 20,
																 bottom: 0,
																 trailing: 20)
		return stack
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Methods
	
	public func setResultLabel(with result: String) {
		let safeResult = String(result)
		resultLabel.text = safeResult
	}
}

extension ModalView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(containerView)
		containerView.addSubview(containerStack)
	}
	
	func setupConstraints() {
		
		NSLayoutConstraint.activate([
			containerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
			containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
			containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
			containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			containerStack.topAnchor.constraint(equalTo: containerView.topAnchor),
			containerStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
			containerStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
			containerStack.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor),
		])
	}
}
