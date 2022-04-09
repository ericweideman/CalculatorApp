//
//  Number.swift
//  Calculator
//
//  Created by Eric Weideman on 4/3/22.
//

import Foundation

class Equation: ObservableObject {
    
    @Published var totalStr: String = ""
    @Published var entryStr: String = ""
    @Published var displayStr: String = "0"
    @Published var currentOperation: Operator = .clear
    @Published var firstOperation: Bool = true
    @Published var storedValueOne: String = ""
    @Published var storedValueTwo: String = ""
    
    init(){
        self.totalStr = totalStr
        self.entryStr = entryStr
        self.displayStr = displayStr
        self.currentOperation = currentOperation
    }
    
    func computeValue (){
        var total: Double = Double(self.totalStr) ?? 0
        
        guard let entry = Double(entryStr) else {
            print("entry did not contain a double")
            return
        }
        
        if currentOperation == .plus {
            total = total + entry
        } else if currentOperation == .minus {
            total = total - entry
        } else if currentOperation == .times {
            total = total * entry
        } else if currentOperation == .divides {
            total = total/entry
        } else {
            return
        }
        
        self.totalStr = String(total)
        self.displayStr = totalStr
        self.entryStr = ""
        return
    }
}

enum Operator: String {
    case plus = "+"
    case minus = "-"
    case times = "x"
    case divides = "÷"
    case clear = "na"
}
