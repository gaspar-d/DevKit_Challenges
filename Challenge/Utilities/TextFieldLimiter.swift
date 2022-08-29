//
//  TextFieldLimiter.swift
//  Challenge
//
//  Created by Diogo Gaspar on 10/07/22.
//

import Foundation

protocol TextFieldLimiter: AnyObject {
	func textLimit(_ currentText: String, newText: String, limit: Int) -> Bool
}

extension TextFieldLimiter {
	
	public func textLimit(_ currentText: String, newText: String, limit: Int) -> Bool {
		let text = currentText
		let atLimit = text.count + newText.count <= limit
		
		return atLimit
	}
}
