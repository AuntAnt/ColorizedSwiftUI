//
//  ContentView.swift
//  ColorizedSwiftUI
//
//  Created by Anton Kuzmin on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    private static let redValue = Double.random(in: 0...255)
    private static let greenValue = Double.random(in: 0...255)
    private static let blueValue = Double.random(in: 0...255)
    
    @State private var redSliderValue = redValue
    @State private var greenSliderValue = greenValue
    @State private var blueSliderValue = blueValue
    
    @State private var redSliderTF = String(lround(redValue))
    @State private var greenSliderTF = String(lround(greenValue))
    @State private var blueSliderTF = String(lround(blueValue))
    
    @State private var isAlertPresent = false
    
    @FocusState private var isFocused: Bool
    
    private var viewColor: Color {
        Color(
            red: redSliderValue / 255,
            green: greenSliderValue / 255,
            blue: blueSliderValue / 255
        )
    }
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(viewColor)
                .frame(height: 200)
            
            HStack {
                VStack(spacing: 40) {
                    ColorSliderView(
                        value: $redSliderValue,
                        text: $redSliderTF,
                        color: .red
                    )
                    ColorSliderView(
                        value: $greenSliderValue,
                        text: $greenSliderTF,
                        color: .green
                    )
                    ColorSliderView(
                        value: $blueSliderValue,
                        text: $blueSliderTF,
                        color: .blue
                    )
                }
                
                VStack(spacing: 40) {
                    TextFieldView(text: $redSliderTF)
                        .focused($isFocused)
                    TextFieldView(text: $greenSliderTF)
                        .focused($isFocused)
                    TextFieldView(text: $blueSliderTF)
                        .focused($isFocused)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done", action: validateTF)
                            .alert(
                                "Wrong format",
                                isPresented: $isAlertPresent,
                                actions: { Button("OK", action: correctTF) },
                                message: { Text("Value can be only numeric") }
                            )
                    }
                }
            }
            
            Spacer()
        }
        .onTapGesture {
            isFocused = false
        }
        .padding()
    }
    
    private func validateTF() {
        validateRedTF()
        validateGreenTF()
        validateBlueTF()
    }
    
    private func validateRedTF() {
        guard let enteredValue = Double(redSliderTF) else { isAlertPresent.toggle()
            return
        }
        
        if !(0.0...255.0).contains(enteredValue) {
            isAlertPresent.toggle()
        } else {
            redSliderValue = enteredValue
        }
    }
    
    private func validateGreenTF() {
        guard let enteredValue = Double(greenSliderTF) else { isAlertPresent.toggle()
            return
        }
        
        if !(0.0...255.0).contains(enteredValue) {
            isAlertPresent.toggle()
        } else {
            greenSliderValue = enteredValue
        }
    }
    
    private func validateBlueTF() {
        guard let enteredValue = Double(blueSliderTF) else { isAlertPresent.toggle()
            return
        }
        
        if !(0.0...255.0).contains(enteredValue) {
            isAlertPresent.toggle()
        } else {
            blueSliderValue = enteredValue
        }
    }
    
    private func correctTF() {
        correctRedTF()
        correctGreenTF()
        correctBlueTF()
    }
    
    private func correctRedTF() {
        redSliderTF = String(lround(redSliderValue))
    }
    
    private func correctGreenTF() {
        greenSliderTF = String(lround(greenSliderValue))
    }
    
    private func correctBlueTF() {
        blueSliderTF = String(lround(blueSliderValue))
    }
}

// MARK: - Slider with value label
struct ColorSliderView: View {
    @Binding var value: Double
    @Binding var text: String
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .frame(width: 45, height: 30)
            Slider(value: $value, in: 0...255, step: 1)
                .onChange(of: value, perform: { text = String(lround($0)) })
            .tint(color)
        }
    }
}

// MARK: - Text field
struct TextFieldView: View {
    @Binding var text: String
    
    var body: some View {
        TextField("", text: $text)
            .textFieldStyle(.roundedBorder)
            .frame(width: 45, height: 30)
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
