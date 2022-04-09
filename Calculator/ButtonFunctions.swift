//
//  Buttons.swift
//  Calculator
//
//  Created by Eric Weideman on 4/7/22.
//

import Foundation
import SwiftUI


extension ContentView {
    
    func numericButton(_ number: String){
        
        if(equation.displayStr.count > 8){
            return
        }
        equation.entryStr.append("\(number)")
        equation.displayStr = equation.entryStr
        equation.firstOperation = false
        return
    }
    
    func operationButton(_ op: Operator){
        equation.currentOperation = op
        
        if equation.firstOperation == true {
            equation.entryStr = "0"
            return
        } else if equation.totalStr == "" {
            equation.totalStr = equation.entryStr
            equation.displayStr = equation.totalStr
            equation.entryStr = ""
        } else if equation.entryStr == ""{
            return
        }else {
            equation.computeValue()
            equation.currentOperation = op
        }
    }
    
    func percentageButton(){
        equation.totalStr = equation.displayStr
        equation.entryStr = "100"
        equation.currentOperation = .divides
        equation.computeValue()
        equation.currentOperation = .clear
    }
    
    func inverseButton(){
        if equation.totalStr == "" {
            equation.totalStr = "-1"
            
        } else if equation.entryStr == "" {
            equation.entryStr = "-1"
        } else {
            equation.totalStr = equation.entryStr
            equation.entryStr = "-1"
        }
        equation.currentOperation = .times
        equation.computeValue()
        equation.currentOperation = .clear
        return
    }
    
    func addDecimal(){
        if equation.entryStr.contains("."){
            return
        } else if equation.entryStr == "" {
           equation.entryStr.append("0.")
        } else{
        equation.entryStr.append(".")
        }
        equation.displayStr = equation.entryStr
        return
    }
    
    func clearButtonViewSelector() -> some View {
        if equation.entryStr != "" || equation.totalStr != "" {
            return ZStack {
                Button {
                    if equation.entryStr != "" {
                        equation.entryStr = ""
                        equation.displayStr = equation.totalStr
                    } else {
                        equation.totalStr = ""
                        equation.displayStr = "0"
                    }
                }label: { Rectangle()}
                    .buttonStyle(DefaultButtonStyle())
                    .modifier(specialButtonModifier())
                Text("C")
                    .modifier(specialTextModifier())
            }
        } else {
            return ZStack{
                Button {
                    equation.entryStr = ""
                    equation.displayStr = "0"
                    equation.totalStr = ""
                    equation.firstOperation = true
                    equation.currentOperation = .clear
                } label: {
                    Rectangle()
                }
                .buttonStyle(DefaultButtonStyle())
                .modifier(specialButtonModifier())
                Text("AC")
                    .modifier(specialTextModifier())
            }
        }
    }

    func equalButton(){
          if equation.currentOperation == .clear {
                return
            }
            equation.computeValue()
            equation.currentOperation = .clear
    }
}
