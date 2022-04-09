//
//  ContentView.swift
//  Calculator
//
//  Created by Eric Weideman on 4/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var equation = Equation()
    

    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                Group{
                    Text("totalStr: \(equation.totalStr)")
                        .foregroundColor(.white)
                    Text("displayStr: \(equation.displayStr)")
                        .foregroundColor(.white)
                    Text("entryStr: \(equation.entryStr)")
                        .foregroundColor(.white)
                    Text("currentOperator: \(equation.currentOperation.rawValue)")
                        .foregroundColor(.white)
                }
                Spacer()
                HStack{
                    Spacer()
                    Text("\(equation.displayStr)")
                        .modifier(displayTextModifier())
                    //add formatting to equation.displayStr string
                }
                HStack{
                    clearButtonViewSelector()
                    ZStack{
                        Button {inverseButton()} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(specialButtonModifier())
                        Text("+/-")
                            .modifier(specialTextModifier())
                    }
                    ZStack{
                        Button {percentageButton()} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(specialButtonModifier())
                        Text("%")
                            .modifier(specialTextModifier())
                    }
                    ZStack{
                        Button {operationButton(.divides)} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(operationButtonModifier(op: $equation.currentOperation, sign: "÷"))
                        Text("÷")
                            .modifier(operationTextModifier(op: $equation.currentOperation, sign: "÷"))
                    }
                }
           
                HStack{
                    
                    ZStack{
                        Button {numericButton("7")} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(numericButtonModifier())
                        Text("7")
                            .modifier(numericTextModifier())
                    }
                    ZStack{
                        Button {numericButton("8")} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(numericButtonModifier())
                        Text("8")
                            .modifier(numericTextModifier())
                    }
                    ZStack{
                        Button {numericButton("9")} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(numericButtonModifier())
                        Text("9")
                            .modifier(numericTextModifier())
                    }
                    ZStack{
                        Button {operationButton(.times)} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(operationButtonModifier(op: $equation.currentOperation, sign: "x"))
                        Text("x")
                            .modifier(operationTextModifier(op: $equation.currentOperation, sign: "x"))
                    }
                }
               
                HStack{
                    ZStack{
                        Button {numericButton("4")} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(numericButtonModifier())
                        Text("4")
                            .modifier(numericTextModifier())
                    }
                    ZStack{
                        Button {numericButton("5")} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(numericButtonModifier())
                        Text("5")
                            .modifier(numericTextModifier())
                    }
                    ZStack{
                        Button {numericButton("6")} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(numericButtonModifier())
                        Text("6")
                            .modifier(numericTextModifier())
                    }
                    ZStack{
                        Button {operationButton(.minus)} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(operationButtonModifier(op: $equation.currentOperation, sign: "-"))
                        Text("-")
                            .modifier(operationTextModifier(op: $equation.currentOperation, sign: "-"))
                    }
                }
                
                HStack{
                    ZStack{
                        Button {numericButton("1")} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(numericButtonModifier())
                        Text("1")
                            .modifier(numericTextModifier())
                    }
                    ZStack{
                        Button {numericButton("2")} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(numericButtonModifier())
                        Text("2")
                            .modifier(numericTextModifier())
                    }
                    ZStack{
                        Button {numericButton("3")} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(numericButtonModifier())
                        Text("3")
                            .modifier(numericTextModifier())
                    }
                    ZStack{
                        Button {operationButton(.plus)} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(operationButtonModifier(op: $equation.currentOperation, sign: "+"))
                        Text("+")
                            .modifier(operationTextModifier(op: $equation.currentOperation, sign: "+"))
                    }
                }
                
                HStack{
                    ZStack{
                        Button {numericButton("0")} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(zeroButtonModifier())
                        Text("0")
                            .modifier(zeroTextModifier())
                    }
                    ZStack{
                        Button {numericButton(".")} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(numericButtonModifier())
                        Text(".")
                            .modifier(numericTextModifier())
                    }
                    ZStack{
                        Button {equalButton()} label: {Rectangle()}
                            .buttonStyle(DefaultButtonStyle())
                            .modifier(operationButtonModifier(op: $equation.currentOperation, sign: "="))
                        Text("=")
                            .modifier(operationTextModifier(op: $equation.currentOperation, sign: "="))
                    }
                }
                .padding(.bottom, 10.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(equation: Equation())
    }
}









