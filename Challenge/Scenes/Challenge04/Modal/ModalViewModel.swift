//
//  ModalViewModel.swift
//  Challenge
//
//  Created by Diogo Gaspar on 20/08/22.
//

import Foundation

protocol ModalViewModelProtocol: AnyObject {
	var getRandomResult: String { get }
}

final class ModalViewModel: NSObject {
	public var result: Int?
}

extension ModalViewModel: ModalViewModelProtocol {
	
	private var getResultDoubled: String {
		guard let safeResult = result else { return "" }
		
		return "O dobro do valor é  \(String(safeResult * 2))"
	}
	
	private var getResultSquareRoot: String {
		guard let safeResult = result else { return "" }
		
		return "A raíz quadrada do valor é \(String(sqrt(Double(safeResult))))"
	}
	
	private var getResultHalfValue: String {
		guard let safeResult = result else { return "" }
		
		return "A metade do valor é \(String(Double(safeResult / 2)))"
	}
	
	private var getResultMonth: String {
		guard let safeResult = result else { return "" }
		
		switch safeResult {
		case 1:
			return "O número informado corresponde ao mês de Janeiro"
		case 2:
			return "O número informado corresponde ao mês de Fevereiro"
		case 3:
			return "O número informado corresponde ao mês de Março"
		case 4:
			return "O número informado corresponde ao mês de Abril"
		case 5:
			return "O número informado corresponde ao mês de Maio"
		case 6:
			return "O número informado corresponde ao mês de Junho"
		case 7:
			return "O número informado corresponde ao mês de Julho"
		case 8:
			return "O número informado corresponde ao mês de Agosto"
		case 9:
			return "O número informado corresponde ao mês de Setembro"
		case 10:
			return "O número informado corresponde ao mês de Outubro"
		case 11:
			return "O número informado corresponde ao mês de Novembro"
		case 12:
			return "O número informado corresponde ao mês de Dezembro"
		default:
			return "O número informado não corresponde a um mês válido"
		}
	}
	
	private var getResultSum: String {
		guard let safeResult = result else { return "" }
		
		let result = String(safeResult).compactMap {
			Int(String($0))
		}.reduce(0, +)
		
		return "A soma de todos os números é \( String(result))"
	}
	
	private var getResultNoIdea: String {
		return "Não faço ideia de que número é esse"
	}
	
	private var getResultBoogeyman: String {
		return "Quando o Bicho Papão vai dormir, ele deixa a luz acesa com medo de Chuck Norris"
	}
	
	private var getMyRandomResult: String {
		return "Alguém tem um vaga para um Dev iOS júnior???"
	}
	
	public var getRandomResult: String {
		let randomElement = Int.random(in: 1...8)
		var result: String = ""
		
		switch randomElement {
		case 1:
			result = getResultDoubled
		case 2:
			result = getResultSquareRoot
		case 3:
			result = getResultHalfValue
		case 4:
			result = getResultMonth
		case 5:
			result = getResultSum
		case 6:
			result = getResultNoIdea
		case 7:
			result = getResultBoogeyman
		case 8:
			result = getMyRandomResult
		default:
			break
		}
		
		return result
	}
	
}
