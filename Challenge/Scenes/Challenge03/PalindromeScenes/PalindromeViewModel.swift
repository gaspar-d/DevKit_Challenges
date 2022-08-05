//
//  PalindromeViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 04/08/22.
//

import Foundation
import UIKit

protocol PalindromeViewModelProtocol: AnyObject {
	func navigateToPalindromeDescription()
	func isPalindrome(input: String, controller: UIViewController) 
}

final class PalindromeViewModel: NSObject {
	weak var coordinator: PalindromeCoordinatorProtocol?
	private let validator: PalindromeValidatorProtocol
	private let alert: AlertsProtocol
	
	init(validator: PalindromeValidatorProtocol, alert: AlertsProtocol) {
		self.validator = validator
		self.alert = alert
	}
}

extension PalindromeViewModel: PalindromeViewModelProtocol {
	
	public func navigateToPalindromeDescription() {
		coordinator?.navigateToPalindromeDescription()
	}
	
	public func isPalindrome(input: String, controller: UIViewController) {
		
		if validator.isInputEmpty(text: input) {
			alert.popup(title: "Campo vazio",
						message: "Por favor insira uma palavra ou frase!",
						controller: controller)
			
		} else if validator.isPalindrome(text: input) {
			alert.popup(title: "Correto",
						message: "A frase informada \nÉ \num palíndromo",
						controller: controller)
			
		} else {
			alert.popup(title: "Errado",
						message: "A frase informada \nNÃO \né um palíndromo",
						controller: controller)
		}
	}
}
