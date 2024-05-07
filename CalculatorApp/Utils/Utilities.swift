//
//  Utilitties.swift
//  CalculatorApp
//
//  Created by Asif on 26/04/2024.
//

import Foundation

class Utilities {
    
    static let shared = Utilities()
    
    private init() {}
    
    // Saving historyList to UserDefaults
    func saveHistoryList(_ historyList: [History]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(historyList) {
            UserDefaults.standard.set(encoded, forKey: "historyList")
        }
    }
    
    // Retrieving historyList from UserDefaults
    func loadHistoryList() -> [History]? {
        if let savedHistoryList = UserDefaults.standard.data(forKey: "historyList") {
            let decoder = JSONDecoder()
            if let decodedHistoryList = try? decoder.decode([History].self, from: savedHistoryList) {
                return decodedHistoryList
            }
        }
        return nil
    }
    
    func clearHistoryList() {
        UserDefaults.standard.removeObject(forKey: "historyList")
    }
        
}

enum AngleType {
    case deg, rad
}

enum CalculationMessage: String {
    case invalidExpression = "INVALID_EXPRESSION"
    case divideByZero = "DIVIDE_BY_ZERO"
    case valueTooLarge = "VALUE_TOO_LARGE"
    case domainError = "DOMAIN_ERROR"
}

class CalculationException: Error {
    let msg: CalculationMessage
    
    init(msg: CalculationMessage) {
        self.msg = msg
    }
}

func handleCalculation() {
    do {
        try performCalculation()
    } catch let error as CalculationException {
        print("Calculation error: \(error.msg.rawValue)")
    } catch {
        print("Unexpected error: \(error)")
    }
}

func performCalculation() throws {
    // Some calculation code
    throw CalculationException(msg: .divideByZero)
}

// Call the function to execute the calculation
//self.handleCalculation()

