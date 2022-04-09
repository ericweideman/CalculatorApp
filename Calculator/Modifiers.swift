//
//  TextModifiers.swift
//  Calculator
//
//  Created by Eric Weideman on 4/8/22.
//

import Foundation
import SwiftUI

struct displayTextModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 56).weight(.bold))
            .foregroundColor(.white)
            .lineLimit(1)
            .minimumScaleFactor(0.75)
            .padding(.horizontal, 20.0)
    }
}

struct specialTextModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.black)
    }
}

struct specialButtonModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.width/5)
            .foregroundColor(Color.specialButtonColor)
            .clipShape(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width/5))
            .padding(.all, 4.0)
    }
}

struct operationTextModifier : ViewModifier {
    
    @Binding var op: Operator
    var sign: String
    
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(op.rawValue == sign ? Color.operatorButtonColor : Color.white)
    }
}

struct operationButtonModifier : ViewModifier {
    
    @Binding var op: Operator
    var sign: String
    
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.width/5)
            .foregroundColor(op.rawValue == sign ? Color.white : Color.operatorButtonColor)
            .clipShape(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width/5))
            .padding(.all, 4.0)
    }
}

struct numericTextModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}

struct numericButtonModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.width/5)
            .foregroundColor(Color.numericButtonColor)
            .clipShape(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width/5))
            .padding(.all, 4.0)
    }
}

struct zeroButtonModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: UIScreen.main.bounds.width*35/80, height: UIScreen.main.bounds.width/5, alignment: .leading)
            .foregroundColor(Color.numericButtonColor)
            .clipShape(RoundedRectangle(cornerRadius: UIScreen.main.bounds.width/5))
            .padding(.all, 4.0)
    }
}

struct zeroTextModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding(.leading, 30.0)
            .frame(width: UIScreen.main.bounds.width*35/80, height: UIScreen.main.bounds.width/5, alignment: .leading)
            .foregroundColor(.white)
            
    }
}

