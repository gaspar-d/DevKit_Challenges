//
//  ViewCodeTemplate.swift
//  Challenge
//
//  Created by Diogo Gaspar on 17/06/22.
//

import Foundation

protocol ViewCodeTemplate {
	func setup()
	func setupComponents()
	func setupConstraints()
	func setupExtraConfiguration()
}

extension ViewCodeTemplate {
	func setup() {
		setupComponents()
		setupConstraints()
		setupExtraConfiguration()
	}
	
	func setupExtraConfiguration() {}
}

