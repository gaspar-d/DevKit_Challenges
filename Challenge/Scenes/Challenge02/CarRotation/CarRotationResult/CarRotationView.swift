//
//  CarRotationView.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import UIKit

final class CarRotationView: UIView {
	
	private lazy var plateLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Insira sua placa"
		return label
	}()
	
	private lazy var newQueryButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.title = "Fazer nova consulta"
		
		let button = UIButton(configuration: configuration)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	private lazy var stack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [plateLabel, newQueryButton])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .equalSpacing
		stack.alignment = .center
		stack.spacing = 20
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
	public func setPlateLabel(plate: String) {
		plateLabel.text = plate
	}
	
	public func setNewQueryButtonAction(target: Any?, action: Selector) {
		newQueryButton.addTarget(target, action: action, for: .touchUpInside)
	}
}

extension CarRotationView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(stack)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			
			newQueryButton.heightAnchor.constraint(equalToConstant: 44),
			newQueryButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2),
			
			stack.centerXAnchor.constraint(equalTo: centerXAnchor),
			stack.centerYAnchor.constraint(equalTo: centerYAnchor),
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .orange
	}
}

