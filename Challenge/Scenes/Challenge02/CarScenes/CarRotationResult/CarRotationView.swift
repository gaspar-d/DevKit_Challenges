//
//  CarRotationView.swift
//  Challenge
//
//  Created by Diogo Gaspar on 05/07/22.
//

import UIKit

final class CarRotationView: UIView {
	
	private let paddings: CGFloat = 20
	
	private lazy var descriptionLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Seu dia de rodízio é"
		label.font = .systemFont(ofSize: 24, weight: .medium)
		return label
	}()
	
	private lazy var weekdayLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = .systemFont(ofSize: 44, weight: .bold)
		return label
	}()
	
	private lazy var rotationDayLabel: UILabel = {
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
		let stack = UIStackView(arrangedSubviews: [descriptionLabel,
												   weekdayLabel,
												   rotationDayLabel,
												   newQueryButton])
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.axis = .vertical
		stack.distribution = .equalSpacing
		stack.alignment = .center
		stack.spacing = paddings
		stack.backgroundColor = .systemFill
		stack.layer.cornerRadius = 5
		stack.isLayoutMarginsRelativeArrangement = true
		stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: paddings,
																 leading: paddings,
																 bottom: paddings,
																 trailing: paddings)
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
	public func setRotationDayLabel(with plate: String) {
		rotationDayLabel.text = plate
	}
	
	public func setWeekdayLabel(with weekday: String) {
		weekdayLabel.text = weekday
	}
	
	public func setNewQueryButtonAction(target: Any?, action: Selector) {
		newQueryButton.addTarget(target, action: action, for: .touchUpInside)
	}
}

extension CarRotationView: ViewCodeTemplate {
	public func setupComponents() {
		addSubview(stack)
	}
	
	public func setupConstraints() {
		NSLayoutConstraint.activate([
			
			newQueryButton.heightAnchor.constraint(equalToConstant: 44),
			newQueryButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2),
			
			stack.centerXAnchor.constraint(equalTo: centerXAnchor),
			stack.centerYAnchor.constraint(equalTo: centerYAnchor),
		])
	}
	
	public func setupExtraConfiguration() {
		backgroundColor = .systemBackground
	}
}

