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

