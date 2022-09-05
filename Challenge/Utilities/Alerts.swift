//
//  Alerts.swift
//  Challenge
//
//  Created by Diogo Gaspar on 26/07/22.
//

import UIKit

protocol AlertsProtocol: AnyObject {
	func popup(title: String, message: String, controller: UIViewController)
}

final class Alerts {}

extension Alerts: AlertsProtocol {
	
	func popup(title: String, message: String, controller: UIViewController) {
		
		let alert = UIAlertController(title: title,
									  message: message,
									  preferredStyle: .alert)
		
		let okAction = UIAlertAction(title: "Ok", style: .destructive)
		alert.addAction(okAction)
		
		controller.present(alert, animated: true)
	}
}
