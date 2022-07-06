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
	
	private lazy var plateButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.title = "Fazer nova consulta"
		
		let button = UIButton(configuration: configuration)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	private lazy var stack: UIStackView = {
		let stack = UIStackView(arrangedSubviews: [plateLabel, plateButton])
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
}

extension CarRotationView: ViewCodeTemplate {
	func setupComponents() {
		addSubview(stack)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			
			plateButton.heightAnchor.constraint(equalToConstant: 44),
			plateButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2),
			
			stack.centerXAnchor.constraint(equalTo: centerXAnchor),
			stack.centerYAnchor.constraint(equalTo: centerYAnchor),
		])
	}
	
	func setupExtraConfiguration() {
		backgroundColor = .orange
	}
}

